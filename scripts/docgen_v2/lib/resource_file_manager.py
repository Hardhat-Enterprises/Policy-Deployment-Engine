"""
Resource File Manager for handling JSON file operations.

This module provides functionality for:
- Creating directory structures for resource JSON files
- Writing resource JSON files with proper formatting
- Reading existing JSON files and parsing them back into Resource objects
- Handling filesystem errors with detailed context
"""

import json
import logging
from pathlib import Path
from typing import Optional

from scripts.docgen_v2.lib.models import Resource, Argument
from scripts.docgen_v2.lib.errors import FilesystemError, ValidationError, ParsingError

logger = logging.getLogger(__name__)


def sanitize_subcategory_for_path(subcategory: str) -> str:
    """
    Sanitize subcategory for use in filesystem paths.
    
    Replaces spaces with underscores to create valid directory names.
    
    Args:
        subcategory: Raw subcategory string (e.g., "S3 (Simple Storage)")
    
    Returns:
        Sanitized string (e.g., "S3_(Simple_Storage)")
    
    Example:
        >>> sanitize_subcategory_for_path("S3 (Simple Storage)")
        'S3_(Simple_Storage)'
        >>> sanitize_subcategory_for_path("Cloud Storage")
        'Cloud_Storage'
        >>> sanitize_subcategory_for_path("Storage")
        'Storage'
    """
    return subcategory.replace(' ', '_')


def get_resource_filename(resource_name: str) -> str:
    """
    Generate filename for resource JSON file by removing CSP prefix.

    Removes the CSP prefix (aws_, azurerm_, google_) from resource names
    to create cleaner filenames.

    Args:
        resource_name: Full resource name (e.g., "aws_s3_bucket")

    Returns:
        Filename without CSP prefix (e.g., "s3_bucket.json")

    Example:
        >>> get_resource_filename("aws_s3_bucket")
        's3_bucket.json'
        >>> get_resource_filename("azurerm_storage_account")
        'storage_account.json'
        >>> get_resource_filename("google_storage_bucket")
        'storage_bucket.json'
    """
    # Remove known CSP prefixes
    for prefix in ['aws_', 'azurerm_', 'google_']:
        if resource_name.startswith(prefix):
            return f"{resource_name[len(prefix):]}.json"

    # If no known prefix, use full name
    return f"{resource_name}.json"


class ResourceFileManager:
    """
    Manages resource template JSON files and directory structures.
    
    This class handles all filesystem operations related to resource JSON files,
    including directory creation, file writing, and reading existing files for
    comparison and change detection.
    
    Responsibilities:
    - Create directory structures following the pattern docs/{csp}/{service}/resource_json/
    - Write resource JSON files with proper formatting (indent=2)
    - Read existing JSON files and parse them back into Resource objects
    - Handle filesystem errors with detailed paths and context
    
    Example:
        >>> manager = ResourceFileManager()
        >>> output_dir = Path("docs")
        >>> dir_path = manager.create_directory_structure("aws", "s3", output_dir)
        >>> print(dir_path)  # docs/aws/s3/resource_json
        >>> 
        >>> resource = Resource("aws_s3_bucket", "S3", {...})
        >>> manager.write_resource_json(resource, output_dir)
        >>> # Creates: docs/aws/s3/resource_json/aws_s3_bucket.template.json
    """
    
    def create_directory_structure(
        self,
        csp: str,
        service: str,
        output_dir: Path = Path("docs")
    ) -> Path:
        """
        Create directory structure for resource JSON files.
        
        Creates the directory path following the pattern:
        {output_dir}/{csp}/{service}/resource_json/
        
        This operation is idempotent - calling it multiple times with the same
        parameters will not cause errors and will result in the same directory.
        
        Args:
            csp: Cloud service provider identifier (e.g., 'aws', 'azure', 'gcp')
            service: Service name (e.g., 's3', 'ec2', 'storage')
            output_dir: Base output directory (default: Path("docs"))
        
        Returns:
            Path: The created directory path
        
        Raises:
            OSError: If directory creation fails (with detailed path in error message)
            PermissionError: If insufficient permissions to create directory
        
        Example:
            >>> manager = ResourceFileManager()
            >>> path = manager.create_directory_structure("aws", "s3")
            >>> print(path)  # docs/aws/s3/resource_json
            >>> 
            >>> # Calling again is safe (idempotent)
            >>> path2 = manager.create_directory_structure("aws", "s3")
            >>> assert path == path2
        """
        # Sanitize service name for filesystem (replace spaces with underscores)
        sanitized_service = sanitize_subcategory_for_path(service)
        
        # Construct the directory path
        dir_path = output_dir / csp / sanitized_service / "resource_json"
        
        try:
            # Create all parent directories as needed (exist_ok=True for idempotence)
            dir_path.mkdir(parents=True, exist_ok=True)
            logger.debug(f"Created directory structure: {dir_path}")
            return dir_path
            
        except PermissionError as e:
            error_msg = f"Permission denied creating directory"
            logger.error(f"{error_msg}: {dir_path}")
            raise FilesystemError(
                error_msg,
                file_path=str(dir_path),
                operation="create directory"
            ) from e
            
        except OSError as e:
            error_msg = f"Failed to create directory: {str(e)}"
            logger.error(f"{error_msg} - {dir_path}")
            raise FilesystemError(
                error_msg,
                file_path=str(dir_path),
                operation="create directory"
            ) from e
    
    def write_resource_json(
        self,
        resource: Resource,
        output_dir: Path = Path("docs")
    ) -> Path:
        """
        Write resource to JSON file with proper formatting.
        
        Creates a JSON file named {resource_name}.template.json in the appropriate
        directory structure. The JSON is formatted with indent=2 for readability.
        
        The directory structure is created automatically if it doesn't exist.
        
        Args:
            resource: Resource object to serialize to JSON
            output_dir: Base output directory (default: Path("docs"))
        
        Returns:
            Path: The path to the written JSON file
        
        Raises:
            OSError: If file writing fails (with detailed path in error message)
            PermissionError: If insufficient permissions to write file
            ValueError: If resource is missing required fields
        
        Example:
            >>> manager = ResourceFileManager()
            >>> resource = Resource("aws_s3_bucket", "S3", {...})
            >>> file_path = manager.write_resource_json(resource)
            >>> print(file_path)  # docs/aws/s3/resource_json/aws_s3_bucket.template.json
        """
        # Validate resource has required fields
        if not resource.resource_name:
            raise ValidationError(
                "Resource must have a resource_name",
                operation="resource validation"
            )
        if not resource.subcategory:
            raise ValidationError(
                "Resource must have a subcategory",
                resource_name=resource.resource_name,
                operation="resource validation"
            )
        
        # Create directory structure
        dir_path = self.create_directory_structure(
            csp=self._extract_csp_from_resource_name(resource.resource_name),
            service=resource.subcategory,
            output_dir=output_dir
        )
        
        # Construct file path with sanitized filename (remove CSP prefix)
        filename = get_resource_filename(resource.resource_name)
        file_path = dir_path / filename
        
        try:
            # Serialize resource to JSON dictionary
            json_dict = resource.to_json_dict()

            # Merge with existing file to preserve user-filled fields
            if file_path.exists():
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        existing_json = json.load(f)
                    json_dict = self._merge_resource_json(json_dict, existing_json)
                except Exception as e:
                    logger.warning(f"Could not read existing file for merge, overwriting: {file_path} - {e}")

            # Write JSON file with proper formatting
            with open(file_path, 'w', encoding='utf-8') as f:
                json.dump(json_dict, f, indent=2, ensure_ascii=False)
                # Add trailing newline for better git diffs
                f.write('\n')
            
            logger.info(f"Wrote resource JSON: {file_path}")
            return file_path
            
        except PermissionError as e:
            error_msg = "Permission denied writing file"
            logger.error(f"{error_msg}: {file_path}")
            raise FilesystemError(
                error_msg,
                resource_name=resource.resource_name,
                file_path=str(file_path),
                operation="write JSON file"
            ) from e
            
        except OSError as e:
            error_msg = f"Failed to write file: {str(e)}"
            logger.error(f"{error_msg} - {file_path}")
            raise FilesystemError(
                error_msg,
                resource_name=resource.resource_name,
                file_path=str(file_path),
                operation="write JSON file"
            ) from e
    
    def read_existing_json(self, file_path: Path) -> Optional[Resource]:
        """
        Read and parse existing JSON file into Resource object.
        
        Reads a resource JSON file and reconstructs the Resource object from it.
        This is used for change detection and comparison between versions.
        
        Note: The returned Resource object will not have provider or version
        metadata set - these should be populated from metadata files if needed.
        
        Args:
            file_path: Path to the JSON file to read
        
        Returns:
            Resource object parsed from JSON, or None if file doesn't exist
        
        Raises:
            OSError: If file reading fails (with detailed path in error message)
            json.JSONDecodeError: If JSON is malformed
            ValueError: If JSON structure is invalid
        
        Example:
            >>> manager = ResourceFileManager()
            >>> file_path = Path("docs/aws/s3/resource_json/aws_s3_bucket.template.json")
            >>> resource = manager.read_existing_json(file_path)
            >>> if resource:
            ...     print(resource.resource_name)  # aws_s3_bucket
        """
        # Check if file exists
        if not file_path.exists():
            logger.debug(f"File does not exist: {file_path}")
            return None
        
        try:
            # Read and parse JSON file
            with open(file_path, 'r', encoding='utf-8') as f:
                json_dict = json.load(f)
            
            # Validate required fields
            if 'resource_name' not in json_dict:
                raise ValidationError(
                    "JSON missing required field 'resource_name'",
                    file_path=str(file_path),
                    operation="parse JSON file"
                )
            if 'subcategory' not in json_dict:
                raise ValidationError(
                    "JSON missing required field 'subcategory'",
                    file_path=str(file_path),
                    operation="parse JSON file"
                )
            if 'arguments' not in json_dict:
                raise ValidationError(
                    "JSON missing required field 'arguments'",
                    file_path=str(file_path),
                    operation="parse JSON file"
                )
            
            # Parse arguments recursively
            arguments = self._parse_arguments_dict(json_dict['arguments'])
            
            # Create Resource object
            resource = Resource(
                resource_name=json_dict['resource_name'],
                subcategory=json_dict['subcategory'],
                arguments=arguments,
                provider=None,  # Metadata not stored in JSON
                version=None    # Metadata not stored in JSON
            )
            
            logger.debug(f"Read resource JSON: {file_path}")
            return resource
            
        except json.JSONDecodeError as e:
            error_msg = f"Malformed JSON in file: {str(e)}"
            logger.error(f"{error_msg} - {file_path}")
            raise ParsingError(
                error_msg,
                file_path=str(file_path),
                operation="parse JSON file"
            ) from e
            
        except OSError as e:
            error_msg = f"Failed to read file: {str(e)}"
            logger.error(f"{error_msg} - {file_path}")
            raise FilesystemError(
                error_msg,
                file_path=str(file_path),
                operation="read JSON file"
            ) from e
    
    def _parse_arguments_dict(self, arguments_dict: dict) -> dict:
        """
        Recursively parse arguments dictionary into Argument objects.
        
        Helper method to convert JSON dictionary representation back into
        Argument objects with proper nesting.
        
        Args:
            arguments_dict: Dictionary of arguments from JSON
        
        Returns:
            Dictionary mapping argument names to Argument objects
        
        Raises:
            ValueError: If argument structure is invalid
        """
        result = {}
        
        for arg_name, arg_dict in arguments_dict.items():
            # Validate required fields
            if 'description' not in arg_dict:
                raise ValidationError(
                    f"Argument {arg_name} missing required field 'description'",
                    operation="parse argument"
                )
            if 'required' not in arg_dict:
                raise ValidationError(
                    f"Argument {arg_name} missing required field 'required'",
                    operation="parse argument"
                )
            
            # Parse nested arguments if present
            nested_args = None
            if 'arguments' in arg_dict and arg_dict['arguments'] is not None:
                nested_args = self._parse_arguments_dict(arg_dict['arguments'])
            
            # Create Argument object
            argument = Argument(
                description=arg_dict['description'],
                required=arg_dict['required'],
                parent=arg_dict.get('parent'),
                deprecated=arg_dict.get('deprecated', False),
                security_impact=arg_dict.get('security_impact'),
                rationale=arg_dict.get('rationale'),
                compliant=arg_dict.get('compliant'),
                non_compliant=arg_dict.get('non_compliant'),
                arguments=nested_args
            )
            
            result[arg_name] = argument
        
        return result
    
    # Fields filled by contributors — never overwritten by auto-generation
    _PRESERVED_FIELDS = frozenset({'security_impact', 'rationale', 'compliant', 'non_compliant'})

    def _merge_resource_json(self, new_json: dict, existing_json: dict) -> dict:
        """Merge new resource JSON with existing, preserving contributor-filled fields."""
        result = new_json.copy()
        if 'arguments' in new_json and 'arguments' in existing_json:
            result['arguments'] = self._merge_arguments(
                new_json['arguments'], existing_json['arguments']
            )
        return result

    def _merge_arguments(self, new_args: dict, existing_args: dict) -> dict:
        """Recursively merge argument dicts, preserving user fields and dropping stale args."""
        result = {}
        for arg_name, new_arg in new_args.items():
            if arg_name in existing_args:
                existing_arg = existing_args[arg_name]
                merged = new_arg.copy()
                # Restore contributor-filled fields if they were set
                for field in self._PRESERVED_FIELDS:
                    if existing_arg.get(field) is not None:
                        merged[field] = existing_arg[field]
                # Recurse into nested arguments
                if new_arg.get('arguments'):
                    merged['arguments'] = self._merge_arguments(
                        new_arg['arguments'], existing_arg.get('arguments') or {}
                    )
                result[arg_name] = merged
            else:
                result[arg_name] = new_arg  # new argument from provider
        # Arguments only in existing are intentionally omitted (removed from provider)
        return result

    def _extract_csp_from_resource_name(self, resource_name: str) -> str:
        """
        Extract CSP identifier from resource name.
        
        Terraform resource names follow the pattern {csp}_{service}_{resource}.
        This method extracts the CSP prefix.
        
        Args:
            resource_name: Full resource name (e.g., 'aws_s3_bucket')
        
        Returns:
            CSP identifier (e.g., 'aws', 'azurerm', 'google')
        
        Raises:
            ValueError: If resource name doesn't contain an underscore
        
        Example:
            >>> manager = ResourceFileManager()
            >>> csp = manager._extract_csp_from_resource_name("aws_s3_bucket")
            >>> print(csp)  # aws
        """
        if '_' not in resource_name:
            raise ValidationError(
                "Invalid resource name format (expected format: {csp}_{resource})",
                resource_name=resource_name,
                operation="extract CSP from resource name"
            )
        
        # Extract prefix before first underscore
        csp = resource_name.split('_')[0]
        
        # Map provider prefixes to standard CSP identifiers
        csp_mapping = {
            'aws': 'aws',
            'azurerm': 'azure',
            'azuread': 'azure',
            'azapi': 'azure',
            'google': 'gcp',
            'google-beta': 'gcp'
        }
        
        return csp_mapping.get(csp, csp)
