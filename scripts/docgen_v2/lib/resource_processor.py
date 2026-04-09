"""
Resource processor for validation and enrichment.

This module provides the ResourceProcessor class which handles:
- Setting parent references on nested arguments
- Validating resource structure and field types
- Ensuring data integrity before JSON serialization

The processor operates on Resource objects after extraction from provider
documentation and before writing to JSON files.
"""

from typing import List, Dict, Optional
from scripts.docgen_v2.lib.models import Resource, Argument


class ResourceProcessor:
    """
    Processes and validates Resource objects.
    
    This class provides methods to enrich resources with parent references
    and validate that all required fields are present and correctly typed.
    
    Methods:
        set_parent_references: Sets parent field on all nested arguments
        validate_structure: Validates resource structure and returns errors
    """
    
    @staticmethod
    def set_parent_references(resource: Resource) -> None:
        """
        Set parent references on all nested arguments in a resource.
        
        Recursively traverses the argument tree and sets the parent field
        on each nested argument to point to its parent argument name.
        Top-level arguments have parent=None.
        
        This method modifies the resource in-place.
        
        Args:
            resource: Resource object to process
            
        Example:
            >>> resource = Resource("aws_s3_bucket", "S3", {
            ...     "bucket": Argument("Bucket name", False, arguments={
            ...         "tags": Argument("Tags", False)
            ...     })
            ... })
            >>> ResourceProcessor.set_parent_references(resource)
            >>> resource.arguments["bucket"].arguments["tags"].parent
            'bucket'
        """
        def set_parent_recursive(arguments: Dict[str, Argument], parent_name: Optional[str] = None) -> None:
            """Recursively set parent references in argument tree."""
            for arg_name, argument in arguments.items():
                # Set parent field
                argument.parent = parent_name
                
                # Recursively process nested arguments
                if argument.arguments:
                    set_parent_recursive(argument.arguments, arg_name)
        
        # Process all top-level arguments (parent=None)
        set_parent_recursive(resource.arguments, parent_name=None)
    
    @staticmethod
    def validate_structure(resource: Resource) -> List[str]:
        """
        Validate resource structure and field types.
        
        Performs comprehensive validation including:
        - All required top-level fields are present
        - All required argument fields are present
        - Parent references point to existing arguments
        - Required field is boolean or null
        
        Args:
            resource: Resource object to validate
            
        Returns:
            List of validation error messages. Empty list if validation passes.
            Each error message includes context about the specific issue.
            
        Example:
            >>> resource = Resource("aws_s3_bucket", "S3", {})
            >>> errors = ResourceProcessor.validate_structure(resource)
            >>> len(errors)  # 0 if valid
            0
        """
        errors = []
        
        # Validate top-level fields (Requirement 6.1)
        if not resource.resource_name:
            errors.append(f"Resource missing required field 'resource_name'")
        if not resource.subcategory:
            errors.append(f"Resource '{resource.resource_name}' missing required field 'subcategory'")
        if resource.arguments is None:
            errors.append(f"Resource '{resource.resource_name}' missing required field 'arguments'")
            return errors  # Can't continue validation without arguments
        
        # Validate all arguments recursively
        def validate_arguments(
            arguments: Dict[str, Argument],
            path: str = "",
            all_arg_names: Optional[Dict[str, bool]] = None
        ) -> None:
            """
            Recursively validate argument structure.
            
            Args:
                arguments: Dictionary of arguments to validate
                path: Current path in argument tree (for error messages)
                all_arg_names: Dictionary of all argument names in the resource (for parent validation)
            """
            # Build set of all argument names on first call
            if all_arg_names is None:
                all_arg_names = {}
                _collect_all_arg_names(resource.arguments, all_arg_names)
            
            for arg_name, argument in arguments.items():
                current_path = f"{path}.{arg_name}" if path else arg_name
                
                # Validate required argument fields (Requirement 6.2)
                if not hasattr(argument, 'description'):
                    errors.append(
                        f"Argument '{current_path}' in resource '{resource.resource_name}' "
                        f"missing required field 'description'"
                    )
                elif argument.description is None:
                    errors.append(
                        f"Argument '{current_path}' in resource '{resource.resource_name}' "
                        f"has null 'description' field"
                    )
                
                if not hasattr(argument, 'required'):
                    errors.append(
                        f"Argument '{current_path}' in resource '{resource.resource_name}' "
                        f"missing required field 'required'"
                    )
                
                if not hasattr(argument, 'deprecated'):
                    errors.append(
                        f"Argument '{current_path}' in resource '{resource.resource_name}' "
                        f"missing required field 'deprecated'"
                    )
                
                if not hasattr(argument, 'parent'):
                    errors.append(
                        f"Argument '{current_path}' in resource '{resource.resource_name}' "
                        f"missing required field 'parent'"
                    )
                
                # Validate required field type (Requirement 6.5)
                if hasattr(argument, 'required') and argument.required is not None:
                    if not isinstance(argument.required, bool):
                        errors.append(
                            f"Argument '{current_path}' in resource '{resource.resource_name}' "
                            f"has invalid 'required' field type: {type(argument.required).__name__}. "
                            f"Must be boolean or null"
                        )
                
                # Validate parent reference exists (Requirement 6.4)
                if hasattr(argument, 'parent') and argument.parent is not None:
                    if argument.parent not in all_arg_names:
                        errors.append(
                            f"Argument '{current_path}' in resource '{resource.resource_name}' "
                            f"references non-existent parent '{argument.parent}'"
                        )
                
                # Recursively validate nested arguments
                if argument.arguments:
                    validate_arguments(argument.arguments, current_path, all_arg_names)
        
        def _collect_all_arg_names(arguments: Dict[str, Argument], names: Dict[str, bool]) -> None:
            """Collect all argument names in the resource for parent validation."""
            for arg_name, argument in arguments.items():
                names[arg_name] = True
                if argument.arguments:
                    _collect_all_arg_names(argument.arguments, names)
        
        # Validate all arguments
        validate_arguments(resource.arguments)
        
        return errors

