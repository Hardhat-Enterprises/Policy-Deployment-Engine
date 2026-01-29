"""
Terraform Markdown Documentation Parser

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
    >>> from scripts.docgen_v2.parser import parse_resource_markdown
    >>> resource = parse_resource_markdown(Path('aws_s3_bucket.html.markdown'))
    >>> print(resource.resource_name)  # 'aws_s3_bucket'
    >>> print(len(resource.arguments))  # 19

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import re
from pathlib import Path
from typing import Dict, Optional, Tuple
from scripts.docgen_v2.lib.models import Argument, Resource
from scripts.docgen_v2.lib.logging_config import get_logger

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
    # Azure pattern: Look for deprecation notices in callout blocks
    # Format: !> **Note:** This resource has been deprecated...
    azure_pattern = r'!>\s+\*\*Note:\*\*\s+This resource has been deprecated[^\n]*(?:\n[^\n]+)*?(?=\n\n|\n#)'
    match = re.search(azure_pattern, content, re.IGNORECASE)
    if match:
        return True, match.group(0).strip()
    
    # GCP pattern: Look for deprecation statements in the resource description
    # Format: "This resource has been deprecated..."
    # Check only the first 50 lines to avoid false positives in examples
    gcp_pattern = r'^\s*This resource has been deprecated[^\n]*'
    lines = content.split('\n')
    for i, line in enumerate(lines[:50]):
        if re.match(gcp_pattern, line, re.IGNORECASE):
            return True, line.strip()
    
    return False, None


def extract_resource_name(content: str) -> Optional[str]:
    """
    Extract resource name from markdown title.
    
    Different providers use different title formats for their resources.
    This function handles all known patterns to extract the resource name.
    
    Args:
        content (str): Markdown file content
    
    Returns:
        Optional[str]: The resource name if found, None otherwise
    
    Supported Patterns:
        - AWS: "# Resource: aws_s3_bucket" or "# Data Source: aws_s3_bucket"
        - Azure: "# azurerm_storage_account"
        - GCP: "# google_storage_bucket"
    
    Example:
        >>> content = "# Resource: aws_s3_bucket\\nManages an S3 bucket."
        >>> name = extract_resource_name(content)
        >>> print(name)  # "aws_s3_bucket"
    """
    # Pattern 1 (AWS): # Resource: aws_s3_bucket or # Data Source: aws_s3_bucket
    pattern1 = r'^#\s+(?:Resource|Data Source):\s+(\S+)'
    match = re.search(pattern1, content, re.MULTILINE)
    if match:
        return match.group(1)
    
    # Pattern 2 (Azure/GCP): # azurerm_storage_account or # google_storage_bucket
    pattern2 = r'^#\s+((?:azurerm|google|aws)_\S+)'
    match = re.search(pattern2, content, re.MULTILINE)
    return match.group(1) if match else None


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
    # Find section starting with "## Argument Reference" or "## Arguments Reference"
    pattern = r'##\s+Arguments?\s+Reference\s*\n+(.*?)(?=\n##\s+|\Z)'
    match = re.search(pattern, content, re.DOTALL | re.IGNORECASE)
    return match.group(1) if match else None


def parse_argument_line(line: str) -> Optional[Tuple[str, bool, str, bool]]:
    """
    Parse a single argument line from markdown documentation.
    
    Extracts argument information from a markdown bullet point line that follows
    the standard Terraform documentation format.
    
    Args:
        line (str): A single line from the argument documentation
    
    Returns:
        Optional[Tuple[str, bool, str, bool]]: A tuple containing:
            - argument_name: The name of the argument
            - is_required: True if required, False if optional
            - description: The argument description text
            - is_deprecated: True if marked as deprecated
        Returns None if the line doesn't match the expected format.
    
    Supported Formats:
        - AWS: "* `bucket` - (Optional, **Deprecated**) The bucket name"
        - Azure: "* `name` - (Required) The resource name"
        - GCP: "* `zone` - (Optional, Deprecated) The zone name"
    
    Example:
        >>> line = "* `bucket` - (Optional, **Deprecated**) S3 bucket name"
        >>> result = parse_argument_line(line)
        >>> print(result)  # ('bucket', False, 'S3 bucket name', True)
    """
    # Pattern matches: * `argument_name` - (Required|Optional, flags...) Description text
    # Captures: argument name, flags in parentheses, description
    pattern = r'^\*\s+`([^`]+)`\s+-\s+\(([^)]+)\)\s+(.+)'
    match = re.match(pattern, line.strip())
    
    if match:
        arg_name = match.group(1)  # The argument name (without backticks)
        flags = match.group(2)     # Content inside parentheses
        description = match.group(3).strip()  # Everything after the parentheses
        
        # Parse flags to determine if required and deprecated
        is_required = 'Required' in flags
        is_deprecated = 'deprecated' in flags.lower()  # Case-insensitive check
        
        return arg_name, is_required, description, is_deprecated
    
    return None


def parse_top_level_arguments(arg_section: str) -> Dict[str, Argument]:
    """
    Parse top-level arguments from the Argument Reference section.
    
    Processes the argument section to extract all top-level arguments,
    handling multi-line descriptions and stopping at nested block sections.
    
    Args:
        arg_section (str): The content of the Argument Reference section
    
    Returns:
        Dict[str, Argument]: Dictionary mapping argument names to Argument objects
    
    Note:
        - Handles multi-line descriptions by accumulating lines until the next bullet point
        - Stops parsing when it encounters a nested block section (###)
        - Creates Argument objects with parent=None for top-level arguments
    
    Example:
        >>> section = '''* `bucket` - (Optional) The bucket name
        ...              Can be up to 63 characters
        ... * `region` - (Required) The AWS region'''
        >>> args = parse_top_level_arguments(section)
        >>> print(len(args))  # 2
        >>> print(args['bucket'].description)  # "The bucket name Can be up to 63 characters"
    """
    arguments = {}
    lines = arg_section.split('\n')
    
    current_arg = None
    current_required = None
    current_deprecated = False
    current_desc_lines = []
    
    for line in lines:
        # Check if this is a new argument line
        parsed = parse_argument_line(line)
        
        if parsed:
            # Save previous argument if exists
            if current_arg:
                description = ' '.join(current_desc_lines).strip()
                # Check for duplicate argument names
                if current_arg in arguments:
                    logger.warning(
                        f"Duplicate argument name '{current_arg}' found in top-level arguments. "
                        f"Keeping last occurrence."
                    )
                arguments[current_arg] = Argument(
                    description=description,
                    required=current_required,
                    deprecated=current_deprecated,
                    parent=None
                )
            
            # Start new argument
            current_arg, current_required, desc, current_deprecated = parsed
            current_desc_lines = [desc]
        
        elif current_arg and line.strip() and not line.startswith('#'):
            # Continuation of description
            current_desc_lines.append(line.strip())
        
        elif line.startswith('###'):
            # Hit a nested block section, stop parsing top-level
            break
    
    # Save last argument
    if current_arg:
        description = ' '.join(current_desc_lines).strip()
        # Check for duplicate argument names
        if current_arg in arguments:
            logger.warning(
                f"Duplicate argument name '{current_arg}' found in top-level arguments. "
                f"Keeping last occurrence."
            )
        arguments[current_arg] = Argument(
            description=description,
            required=current_required,
            deprecated=current_deprecated,
            parent=None
        )
    
    return arguments


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
    lines = block_content.split('\n')
    
    current_arg = None
    current_required = None
    current_deprecated = False
    current_desc_lines = []
    
    for line in lines:
        parsed = parse_argument_line(line)
        
        if parsed:
            # Save previous argument
            if current_arg:
                description = ' '.join(current_desc_lines).strip()
                # Check for duplicate argument names
                if current_arg in arguments:
                    logger.warning(
                        f"Duplicate argument name '{current_arg}' found in block '{parent}'. "
                        f"Keeping last occurrence."
                    )
                arguments[current_arg] = Argument(
                    description=description,
                    required=current_required,
                    deprecated=current_deprecated,
                    parent=parent
                )
            
            # Start new argument
            current_arg, current_required, desc, current_deprecated = parsed
            current_desc_lines = [desc]
        
        elif current_arg and line.strip() and not line.startswith('#'):
            current_desc_lines.append(line.strip())
    
    # Save last argument
    if current_arg:
        description = ' '.join(current_desc_lines).strip()
        # Check for duplicate argument names
        if current_arg in arguments:
            logger.warning(
                f"Duplicate argument name '{current_arg}' found in block '{parent}'. "
                f"Keeping last occurrence."
            )
        arguments[current_arg] = Argument(
            description=description,
            required=current_required,
            deprecated=current_deprecated,
            parent=parent
        )
    
    return arguments


def merge_nested_arguments(
    top_level: Dict[str, Argument],
    nested_blocks: Dict[str, Dict[str, Argument]]
) -> Dict[str, Argument]:
    """
    Merge nested arguments into their parent arguments.
    
    Combines the top-level arguments with their nested argument blocks
    to create the complete argument hierarchy.
    
    Args:
        top_level (Dict[str, Argument]): Top-level arguments
        nested_blocks (Dict[str, Dict[str, Argument]]): Nested argument blocks
            keyed by parent argument name
    
    Returns:
        Dict[str, Argument]: The top-level arguments with nested arguments
            merged into their parent's 'arguments' field
    
    Note:
        If a top-level argument name matches a nested block name, the nested
        arguments are added to that argument's 'arguments' field.
    
    Example:
        >>> top_level = {'cors_rule': Argument(...)}
        >>> nested = {'cors_rule': {'allowed_methods': Argument(...)}}
        >>> merged = merge_nested_arguments(top_level, nested)
        >>> print('allowed_methods' in merged['cors_rule'].arguments)  # True
    """
    for arg_name, arg in top_level.items():
        if arg_name in nested_blocks:
            arg.arguments = nested_blocks[arg_name]
    
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


def parse_resource_markdown(file_path: Path) -> Optional[Resource]:
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
        logger.error(f"Could not extract resource name from {file_path}")
        return None
    
    # Step 4: Extract Argument Reference section
    arg_section = extract_argument_section(remaining_content)
    if not arg_section:
        logger.error(f"Could not find Argument Reference section in {file_path}")
        return None
    
    # Step 5: Parse top-level arguments
    top_level_args = parse_top_level_arguments(arg_section)
    logger.debug(f"Parsed {len(top_level_args)} top-level arguments from {resource_name}")
    
    # Step 6: Extract nested blocks
    nested_blocks = extract_nested_blocks(remaining_content)
    logger.debug(f"Found {len(nested_blocks)} nested blocks in {resource_name}")
    
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
