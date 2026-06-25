"""
Terraform Markdown Documentation Parser

LEGACY (mostly): the live docgen pipeline derives argument structure/types from
the Terraform *schema* (lib/arg_flatten.py) and descriptions/gating from
lib/descriptions.py — NOT from this markdown parser. The only function still used
in production is ``extract_subcategory_from_frontmatter`` (by lib/service_map.py).
``parse_resource_markdown`` and the ``Argument``/``Resource`` models it builds are
retained for their test coverage and possible reuse; they are not on the
generate path. Do not treat this module as docgen's schema source.

A comprehensive parser for extracting Terraform resource schemas from provider
markdown documentation. Supports all three major cloud providers (AWS, Azure, GCP)
and handles both argument-level and resource-level deprecation.

Features:
    - Extracts resource names, subcategories, and argument schemas
    - Handles nested arguments with proper parent-child relationships
    - Detects deprecated arguments and resources across all providers
    - Supports multiple markdown formats (AWS, Azure, GCP)
    - Generates structured output matching specification requirements

Supported Providers:
    - AWS: Argument-level deprecation with **Deprecated** markers
    - Azure: Resource-level deprecation with replacement resources
    - GCP: Mixed approach with both argument and resource deprecation

Example:
    >>> from pathlib import Path
    >>> from scripts.docgen.lib.parser import parse_resource_markdown
    >>> resource = parse_resource_markdown(Path('aws_s3_bucket.html.markdown'))
    >>> print(resource.resource_name)  # 'aws_s3_bucket'
    >>> print(len(resource.arguments))  # 19

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import re
from pathlib import Path
from typing import Dict, Optional, Tuple
from scripts.docgen.lib.models import Argument, Resource
from scripts.docgen.lib.logging_config import get_logger

logger = get_logger(__name__)


def extract_subcategory_from_frontmatter(content: str) -> Tuple[Optional[str], str]:
    """
    Extract subcategory from YAML front matter using regex.
    
    Parses the YAML front matter at the beginning of markdown files to extract
    the subcategory field, which indicates the service category for the resource.
    
    Args:
        content (str): Full markdown file content including YAML front matter
    
    Returns:
        Tuple[Optional[str], str]: A tuple containing:
            - subcategory: The extracted subcategory string, or None if not found
            - remaining_content: The markdown content without the front matter
    
    Example:
        >>> content = '''---
        ... subcategory: "S3 (Simple Storage)"
        ... ---
        ... # Resource: aws_s3_bucket'''
        >>> subcategory, remaining = extract_subcategory_from_frontmatter(content)
        >>> print(subcategory)  # "S3 (Simple Storage)"
    
    Note:
        Handles both quoted and unquoted subcategory values in the YAML.
    """
    # Match the entire YAML front matter block (between --- markers)
    frontmatter_pattern = r'^---\n(.*?)\n---\n(.*)'
    match = re.match(frontmatter_pattern, content, re.DOTALL)
    
    if not match:
        return None, content
    
    frontmatter = match.group(1)  # YAML content
    remaining_content = match.group(2)  # Markdown content after front matter
    
    # Extract subcategory field with regex
    # Handles both quoted and unquoted values:
    # subcategory: "S3 (Simple Storage)" or subcategory: S3
    subcat_pattern = r'subcategory:\s*["\']?([^"\'\n]+)["\']?'
    subcat_match = re.search(subcat_pattern, frontmatter)
    
    if subcat_match:
        subcategory = subcat_match.group(1).strip()
        return subcategory, remaining_content
    
    return None, remaining_content


def check_resource_deprecation(content: str) -> Tuple[bool, Optional[str]]:
    """
    Check if the entire resource is deprecated.
    
    Detects resource-level deprecation notices that indicate the entire resource
    should not be used. Different providers use different patterns for this.
    
    Args:
        content (str): Full markdown file content
    
    Returns:
        Tuple[bool, Optional[str]]: A tuple containing:
            - is_deprecated: True if the resource is deprecated, False otherwise
            - deprecation_message: The full deprecation message if found, None otherwise
    
    Supported Patterns:
        - Azure: "!> **Note:** This resource has been deprecated..."
        - GCP: "This resource has been deprecated..."
        - AWS: Currently no resource-level deprecation pattern
    
    Example:
        >>> content = "!> **Note:** This resource has been deprecated in version 3.0"
        >>> is_deprecated, message = check_resource_deprecation(content)
        >>> print(is_deprecated)  # True
    """
    # Deprecation notices always sit near the top of the doc. Scan only the first
    # 50 lines (one split, reused by both patterns) to bound the work and avoid
    # false positives from "deprecated" mentions in example blocks lower down.
    lines = content.split('\n')
    head = '\n'.join(lines[:50])

    # Azure pattern: a callout block, possibly spanning a few lines.
    # Format: !> **Note:** This resource has been deprecated...
    azure_pattern = r'!>\s+\*\*Note:\*\*\s+This resource has been deprecated[^\n]*(?:\n[^\n]+)*?(?=\n\n|\n#)'
    match = re.search(azure_pattern, head, re.IGNORECASE)
    if match:
        return True, match.group(0).strip()

    # GCP pattern: a single-line deprecation statement in the description.
    # Format: "This resource has been deprecated..."
    gcp_pattern = r'^\s*This resource has been deprecated[^\n]*'
    for line in lines[:50]:
        if re.match(gcp_pattern, line, re.IGNORECASE):
            return True, line.strip()

    return False, None


def extract_resource_name(content: str) -> Optional[str]:
    r"""
    Extract resource name from markdown title.
    
    Different providers use different title formats for their resources.
    This function handles all known patterns to extract the resource name.
    
    Args:
        content (str): Markdown file content
    
    Returns:
        Optional[str]: The resource name if found, None otherwise
    
    Supported Patterns:
        - AWS: "# Resource: aws_s3_bucket" or "# Data Source: aws_s3_bucket"
        - Azure: "# azurerm_storage_account" or "# azurerm\_storage\_account"
        - GCP: "# google_storage_bucket" or "# google\_biglake\_catalog"
    
    Note:
        Handles escaped underscores (\_) in resource names by unescaping them.
    
    Example:
        >>> content = "# Resource: aws_s3_bucket\nManages an S3 bucket."
        >>> name = extract_resource_name(content)
        >>> print(name)  # "aws_s3_bucket"
        >>> content = r"# google\_biglake\_catalog" + "\nManages a BigLake catalog."
        >>> name = extract_resource_name(content)
        >>> print(name)  # "google_biglake_catalog"
    """
    # Pattern 1 (AWS): # Resource: aws_s3_bucket or # Data Source: aws_s3_bucket
    pattern1 = r'^#\s+(?:Resource|Data Source):\s+(\S+)'
    match = re.search(pattern1, content, re.MULTILINE)
    if match:
        resource_name = match.group(1)
        # Unescape markdown escaped underscores
        return resource_name.replace(r'\_', '_')
    
    # Pattern 2 (Azure/GCP): # azurerm_storage_account or # google_storage_bucket
    # Also handles escaped underscores: # google\_biglake\_catalog
    # Pattern matches provider name followed by underscore (escaped or not) and remaining name
    pattern2 = r'^#\s+((?:azurerm|google|aws)(?:_|\\_)\S+)'
    match = re.search(pattern2, content, re.MULTILINE)
    if match:
        resource_name = match.group(1)
        # Unescape markdown escaped underscores
        return resource_name.replace(r'\_', '_')
    
    return None


def extract_argument_section(content: str) -> Optional[str]:
    """
    Extract the Argument Reference section from markdown.
    
    Locates and extracts the section containing argument documentation,
    which is typically titled "Argument Reference" or "Arguments Reference".
    
    Args:
        content (str): Markdown file content
    
    Returns:
        Optional[str]: The content of the argument section if found, None otherwise
    
    Note:
        The function looks for level 2 headers (##) and extracts content until
        the next level 2 header or end of file.
    
    Example:
        >>> content = '''## Argument Reference
        ... * `bucket` - (Optional) The bucket name
        ... ## Attribute Reference'''
        >>> section = extract_argument_section(content)
        >>> print("bucket" in section)  # True
    """
    # Find section starting with "## Argument Reference" (with optional trailing text)
    pattern = r'##\s+Arguments?\s+Reference[^\n]*\n+(.*?)(?=\n##\s+|\Z)'
    match = re.search(pattern, content, re.DOTALL | re.IGNORECASE)
    return match.group(1) if match else None


def parse_argument_line(line: str) -> Optional[Tuple[str, Optional[bool], str, bool]]:
    """
    Parse a single argument line from markdown documentation.

    Handles two formats found in Terraform provider docs:

    Single-line (AWS / Azure / most GCP):
        * `bucket` - (Optional, **Deprecated**) The bucket name

    Multi-line (some GCP docs split flags onto the next line):
        * `job_id` -
          (Required)
          The ID of the job...

    For the multi-line format the function returns is_required=None as a sentinel
    meaning "flags not yet seen — caller should read the next line for (flags)".

    Returns:
        (arg_name, is_required, description, is_deprecated)
        is_required is None when flags are on the following line.
        Returns None if the line is not an argument bullet at all.
    """
    stripped = line.strip()

    # Single-line: * `name` - (flags) description
    m = re.match(r'^\*\s+`([^`]+)`\s+-\s+\(([^)]+)\)\s*(.*)', stripped)
    if m:
        arg_name = m.group(1)
        flags = m.group(2)
        description = m.group(3).strip()
        return arg_name, 'Required' in flags, description, 'deprecated' in flags.lower()

    # Multi-line opener: * `name` -   (flags on next line)
    m = re.match(r'^\*\s+`([^`]+)`\s+-\s*$', stripped)
    if m:
        return m.group(1), None, '', False

    return None


def parse_flags_line(line: str) -> Optional[Tuple[bool, bool]]:
    """
    Parse a standalone flags line like "  (Required)" or "  (Optional, Deprecated)".

    Used when parse_argument_line returns is_required=None (multi-line GCP format).

    Returns:
        (is_required, is_deprecated) or None if line is not a flags line.
    """
    m = re.match(r'^\s*\(([^)]+)\)\s*$', line)
    if m:
        flags = m.group(1)
        return 'Required' in flags, 'deprecated' in flags.lower()
    return None


def parse_top_level_arguments(arg_section: str):
    """
    Parse top-level arguments and inline block arguments from the Argument Reference section.

    Handles two structural patterns found in Terraform provider docs:
    - Plain top-level bullet points: top-level arguments
    - "The `X` block supports:" headers (with optional anchor): inline nested block arguments

    Anchor names encode the hierarchy:
      <a name="nested_query_connection_properties"></a>The `connection_properties` block supports:
    means connection_properties is nested under query, giving dot-path "query.connection_properties".

    Args:
        arg_section (str): The content of the Argument Reference section

    Returns:
        Tuple[Dict[str, Argument], Dict[str, Dict[str, Argument]]]:
            - top_level: top-level argument name → Argument
            - inline_blocks: dot-path key → {arg name → Argument}
              e.g. {"query": {...}, "query.connection_properties": {...}, "load": {...}}
    """
    # Captures optional anchor suffix (group 1) and block name (group 2).
    # Handles both:
    #   <a name="nested_query_connection_properties"></a>The `connection_properties` block supports:
    #   The `connection_properties` block supports:
    _inline_block_re = re.compile(
        r'(?:<a[^>]*name=["\']nested_([^"\']+)["\'][^>]*>(?:</a>)?\s*)?'
        r'(?:The|An|A)\s+`([^`]+)`\s+block[^:]*:',
        re.IGNORECASE
    )

    top_level = {}
    inline_blocks = {}
    anchor_to_path = {}  # anchor_suffix → dot-path, built as we go

    current_arg = None
    current_required = None      # None = "pending flags line"
    current_deprecated = False
    current_desc_lines = []
    current_context = None       # None → top-level; dot-path str → current block path
    awaiting_flags = False       # True when we opened a multi-line arg and need (flags)

    def _path_for(anchor_suffix, block_name):
        """Resolve the full dot-path for an inline block using its anchor name."""
        if anchor_suffix is None:
            return block_name
        if anchor_suffix == block_name:
            # Root-level block (anchor matches block name exactly)
            return block_name
        suffix = '_' + block_name
        if anchor_suffix.endswith(suffix):
            parent_anchor = anchor_suffix[: -len(suffix)]
            if parent_anchor in anchor_to_path:
                return anchor_to_path[parent_anchor] + '.' + block_name
        return block_name  # fallback: treat as root-level

    def _flush():
        nonlocal current_arg
        if not current_arg:
            return
        description = ' '.join(current_desc_lines).strip()
        arg = Argument(
            description=description,
            required=current_required,
            deprecated=current_deprecated,
            parent=current_context,
        )
        if current_context is None:
            top_level[current_arg] = arg
        else:
            if current_context not in inline_blocks:
                inline_blocks[current_context] = {}
            inline_blocks[current_context][current_arg] = arg
        current_arg = None

    for line in lines_of(arg_section):
        if line.startswith('###'):
            _flush()
            break

        bm = _inline_block_re.match(line.strip())
        if bm:
            _flush()
            anchor_suffix = bm.group(1)   # e.g. "query_connection_properties" or None
            block_name = bm.group(2)      # e.g. "connection_properties"
            path_key = _path_for(anchor_suffix, block_name)
            if anchor_suffix:
                anchor_to_path[anchor_suffix] = path_key
            current_context = path_key
            awaiting_flags = False
            continue

        parsed = parse_argument_line(line)
        if parsed:
            _flush()
            current_arg, current_required, desc, current_deprecated = parsed
            current_desc_lines = [desc] if desc else []
            awaiting_flags = (current_required is None)
        elif awaiting_flags and current_arg:
            flags_parsed = parse_flags_line(line)
            if flags_parsed:
                current_required, current_deprecated = flags_parsed
                awaiting_flags = False
            # ignore blank lines while waiting for flags
        elif current_arg and not awaiting_flags and line.strip() and not line.startswith('#'):
            current_desc_lines.append(line.strip())

    _flush()
    return top_level, inline_blocks


def lines_of(text: str):
    """Yield lines from text without holding the full split list."""
    yield from text.split('\n')


def extract_nested_blocks(content: str) -> Dict[str, Dict[str, Argument]]:
    """
    Extract nested argument blocks from ### subsections.
    
    Finds and parses all level 3 header sections (###) that contain
    nested argument documentation for complex argument types.
    
    Args:
        content (str): Full markdown file content
    
    Returns:
        Dict[str, Dict[str, Argument]]: Dictionary mapping block names to
            dictionaries of their arguments
    
    Note:
        - Block names are extracted from section titles or derived from titles
        - If title contains backticks (e.g., "The `cors_rule` block"), uses the quoted name
        - Otherwise converts title to snake_case
    
    Example:
        >>> content = '''### CORS Rule
        ... * `allowed_methods` - (Required) HTTP methods
        ... ### The `lifecycle_rule` block
        ... * `enabled` - (Optional) Enable the rule'''
        >>> blocks = extract_nested_blocks(content)
        >>> print(list(blocks.keys()))  # ['cors_rule', 'lifecycle_rule']
    """
    nested_blocks = {}
    
    # Find all ### subsections
    pattern = r'###\s+(.+?)\n+(.*?)(?=\n###|\n##|\Z)'
    
    for match in re.finditer(pattern, content, re.DOTALL):
        block_title = match.group(1).strip()
        block_content = match.group(2)
        
        # Extract the block name from title like "CORS Rule" or "The `cors_rule` configuration block"
        block_name_match = re.search(r'`([^`]+)`', block_title)
        if block_name_match:
            block_name = block_name_match.group(1)
        else:
            # Use title as-is, converted to snake_case
            block_name = block_title.lower().replace(' ', '_')
        
        # Parse arguments in this block
        block_args = parse_block_arguments(block_content, parent=block_name)
        
        if block_args:
            nested_blocks[block_name] = block_args
    
    return nested_blocks


def parse_block_arguments(block_content: str, parent: str) -> Dict[str, Argument]:
    """
    Parse arguments within a nested block.
    
    Processes the content of a nested block section to extract all arguments
    that belong to a complex argument type.
    
    Args:
        block_content (str): The content of the nested block section
        parent (str): The name of the parent argument this block belongs to
    
    Returns:
        Dict[str, Argument]: Dictionary mapping argument names to Argument objects
            with parent field set to the parent argument name
    
    Note:
        Similar to parse_top_level_arguments but sets the parent field for
        all created arguments to establish the nesting relationship.
    
    Example:
        >>> content = '''* `allowed_methods` - (Required) List of HTTP methods
        ... * `allowed_origins` - (Required) List of origins'''
        >>> args = parse_block_arguments(content, "cors_rule")
        >>> print(args['allowed_methods'].parent)  # "cors_rule"
    """
    arguments = {}
    current_arg = None
    current_required = None
    current_deprecated = False
    current_desc_lines = []
    awaiting_flags = False

    def _flush_block():
        nonlocal current_arg
        if not current_arg:
            return
        arguments[current_arg] = Argument(
            description=' '.join(current_desc_lines).strip(),
            required=current_required,
            deprecated=current_deprecated,
            parent=parent,
        )
        current_arg = None

    for line in block_content.split('\n'):
        parsed = parse_argument_line(line)
        if parsed:
            _flush_block()
            current_arg, current_required, desc, current_deprecated = parsed
            current_desc_lines = [desc] if desc else []
            awaiting_flags = (current_required is None)
        elif awaiting_flags and current_arg:
            flags_parsed = parse_flags_line(line)
            if flags_parsed:
                current_required, current_deprecated = flags_parsed
                awaiting_flags = False
        elif current_arg and not awaiting_flags and line.strip() and not line.startswith('#'):
            current_desc_lines.append(line.strip())

    _flush_block()
    return arguments


def merge_nested_arguments(
    top_level: Dict[str, Argument],
    nested_blocks: Dict[str, Dict[str, Argument]]
) -> Dict[str, Argument]:
    """
    Merge nested block arguments into their parent arguments.

    nested_blocks keys are dot-path strings that encode depth:
      "query"                        → top_level["query"].arguments
      "query.connection_properties"  → top_level["query"].arguments["connection_properties"].arguments
      "load.time_partitioning"       → top_level["load"].arguments["time_partitioning"].arguments

    Paths are processed shallowest-first so parents exist before children are attached.
    If a block name does not exist at its expected parent level a synthetic Argument
    shell is created so children are never silently dropped.
    """
    for path_key in sorted(nested_blocks, key=lambda p: p.count('.')):
        block_args = nested_blocks[path_key]
        parts = path_key.split('.')

        # Walk down the tree to the node that should own these args
        current_dict = top_level
        for part in parts:
            if part not in current_dict:
                # Create a placeholder so sub-blocks are not lost
                current_dict[part] = Argument(
                    description='',
                    required=False,
                    deprecated=False,
                    parent=None,
                )
            node = current_dict[part]
            if node.arguments is None:
                node.arguments = {}
            current_dict = node.arguments

        # current_dict is now the .arguments dict of the target node;
        # populate it with this block's args (don't overwrite existing keys)
        for arg_name, arg in block_args.items():
            if arg_name not in current_dict:
                current_dict[arg_name] = arg

    return top_level


def mark_all_arguments_deprecated(arguments: Dict[str, Argument], deprecation_message: str) -> None:
    """
    Mark all arguments (including nested) as deprecated.
    
    When an entire resource is deprecated, this function marks all of its
    arguments as deprecated and updates their descriptions to indicate
    the resource-level deprecation.
    
    Args:
        arguments (Dict[str, Argument]): Dictionary of arguments to mark as deprecated
        deprecation_message (str): The deprecation message from the resource
    
    Note:
        - Sets deprecated=True on all arguments
        - Prepends "[RESOURCE DEPRECATED]" to descriptions
        - Recursively processes nested arguments
        - Avoids duplicate prefixes if already present
    
    Example:
        >>> args = {'name': Argument(description="The name", required=True)}
        >>> mark_all_arguments_deprecated(args, "Resource deprecated in v3.0")
        >>> print(args['name'].deprecated)  # True
        >>> print(args['name'].description)  # "[RESOURCE DEPRECATED] The name"
    """
    deprecation_prefix = "[RESOURCE DEPRECATED] "
    
    for arg in arguments.values():
        arg.deprecated = True
        # Prepend deprecation notice if not already there
        if not arg.description.startswith(deprecation_prefix):
            arg.description = f"{deprecation_prefix}{arg.description}"
        
        # Recursively mark nested arguments
        if arg.arguments:
            mark_all_arguments_deprecated(arg.arguments, deprecation_message)


def parse_resource_markdown(
    file_path: Path,
    resource_name_hint: Optional[str] = None
) -> Optional[Resource]:
    """
    Parse a Terraform resource markdown file.
    
    Main entry point for parsing Terraform provider documentation files.
    Extracts all resource information including name, subcategory, arguments,
    and handles both argument-level and resource-level deprecation.
    
    Args:
        file_path (Path): Path to the markdown file to parse
    
    Returns:
        Optional[Resource]: A Resource object containing all extracted information,
            or None if parsing fails
    
    Raises:
        No exceptions are raised; errors are logged and None is returned
    
    Processing Steps:
        1. Extract subcategory from YAML front matter
        2. Check for resource-level deprecation
        3. Extract resource name from title
        4. Find and parse Argument Reference section
        5. Parse top-level arguments
        6. Extract and parse nested argument blocks
        7. Merge nested arguments with their parents
        8. Mark all arguments as deprecated if resource is deprecated
    
    Example:
        >>> from pathlib import Path
        >>> resource = parse_resource_markdown(Path('aws_s3_bucket.html.markdown'))
        >>> if resource:
        ...     print(f"Parsed {resource.resource_name} with {len(resource.arguments)} arguments")
    
    Note:
        Supports all three major cloud providers (AWS, Azure, GCP) with their
        different documentation formats and deprecation patterns.
    """
    try:
        content = file_path.read_text(encoding='utf-8')
    except Exception as e:
        logger.error(f"Error reading file {file_path}: {e}")
        return None
    
    # Step 1: Extract subcategory from front matter
    subcategory, remaining_content = extract_subcategory_from_frontmatter(content)
    if not subcategory:
        subcategory = 'Unknown'
        logger.warning(f"No subcategory found in {file_path}, using 'Unknown'")
    
    # Step 2: Check if entire resource is deprecated
    resource_is_deprecated, deprecation_message = check_resource_deprecation(content)
    if resource_is_deprecated:
        logger.info(f"Resource in {file_path} is deprecated: {deprecation_message}")
    
    # Step 3: Extract resource name
    resource_name = extract_resource_name(remaining_content)
    if not resource_name:
        if resource_name_hint:
            # IAM files document multiple resources with no single header — use the caller's hint
            resource_name = resource_name_hint
        else:
            logger.error(f"Could not extract resource name from {file_path}")
            return None
    
    # Step 4: Extract Argument Reference section
    arg_section = extract_argument_section(remaining_content)
    if not arg_section:
        logger.error(f"Could not find Argument Reference section in {file_path}")
        return None
    
    # Step 5: Parse top-level arguments (also collects inline block args)
    top_level_args, inline_block_args = parse_top_level_arguments(arg_section)
    logger.debug(f"Parsed {len(top_level_args)} top-level arguments from {resource_name}")

    # Step 6: Extract ### nested blocks
    nested_blocks = extract_nested_blocks(remaining_content)
    logger.debug(f"Found {len(nested_blocks)} nested blocks in {resource_name}")

    # Merge inline blocks into nested_blocks (### sections win on name collision)
    for block_name, block_args in inline_block_args.items():
        if block_name not in nested_blocks:
            nested_blocks[block_name] = block_args

    # Step 7: Merge nested arguments into parents
    all_arguments = merge_nested_arguments(top_level_args, nested_blocks)
    
    # Step 8: If resource is deprecated, mark all arguments as deprecated
    if resource_is_deprecated:
        mark_all_arguments_deprecated(all_arguments, deprecation_message or "Resource deprecated")
    
    return Resource(
        resource_name=resource_name,
        subcategory=subcategory,
        arguments=all_arguments
    )
