"""
Resource change detection for version comparison.

This module provides functionality to compare two versions of a Terraform resource
and detect all changes including added arguments, removed arguments, and modifications
to existing argument properties.
"""

from typing import Dict, List, Set
from scripts.docgen_v2.lib.models import Argument, ArgumentChange, ChangeReport, Resource


class ResourceChangeDetector:
    """
    Detects and reports changes between two versions of a Terraform resource.
    
    This class compares old and new Resource objects to identify all differences
    in their argument structures, including nested arguments. It tracks additions,
    removals, and modifications to argument properties.
    
    Example:
        >>> detector = ResourceChangeDetector()
        >>> old_resource = Resource("aws_s3_bucket", "S3", {...}, "aws", "5.0.0")
        >>> new_resource = Resource("aws_s3_bucket", "S3", {...}, "aws", "5.1.0")
        >>> report = detector.detect_changes(old_resource, new_resource)
        >>> print(f"Found {len(report.added_arguments)} new arguments")
    """
    
    def detect_changes(self, old: Resource, new: Resource) -> ChangeReport:
        """
        Compare old and new resource schemas and generate a change report.
        
        This method performs a comprehensive comparison of two resource versions,
        detecting all changes to the argument structure. It reads version information
        from the Resource.version fields and recursively compares all arguments.
        
        Args:
            old (Resource): Previous version of the resource
            new (Resource): New version of the resource
        
        Returns:
            ChangeReport: Complete report of all detected changes
        
        Example:
            >>> detector = ResourceChangeDetector()
            >>> old = Resource("aws_s3_bucket", "S3", {"bucket": arg1}, "aws", "5.0.0")
            >>> new = Resource("aws_s3_bucket", "S3", {"bucket": arg2}, "aws", "5.1.0")
            >>> report = detector.detect_changes(old, new)
            >>> print(report.old_version)  # "5.0.0"
            >>> print(report.new_version)  # "5.1.0"
        """
        # Initialize change tracking
        added_arguments: List[str] = []
        removed_arguments: List[str] = []
        modified_arguments: List[ArgumentChange] = []
        
        # Compare argument structures
        self._compare_arguments(
            old.arguments,
            new.arguments,
            "",  # Start with empty path prefix
            added_arguments,
            removed_arguments,
            modified_arguments
        )
        
        # Create and return change report
        return ChangeReport(
            resource_name=new.resource_name,
            old_version=old.version,
            new_version=new.version,
            added_arguments=added_arguments,
            removed_arguments=removed_arguments,
            modified_arguments=modified_arguments
        )
    
    def _compare_arguments(
        self,
        old_args: Dict[str, Argument],
        new_args: Dict[str, Argument],
        path_prefix: str,
        added: List[str],
        removed: List[str],
        modified: List[ArgumentChange]
    ) -> None:
        """
        Recursively compare two argument dictionaries and track changes.
        
        This method performs a deep comparison of argument structures, handling
        nested arguments recursively. It updates the provided lists with any
        detected changes.
        
        Args:
            old_args (Dict[str, Argument]): Arguments from old version
            new_args (Dict[str, Argument]): Arguments from new version
            path_prefix (str): Current path in the argument tree (e.g., "logging.")
            added (List[str]): List to append added argument paths to
            removed (List[str]): List to append removed argument paths to
            modified (List[ArgumentChange]): List to append modifications to
        
        Example:
            >>> detector = ResourceChangeDetector()
            >>> old_args = {"bucket": Argument("Old desc", True)}
            >>> new_args = {"bucket": Argument("New desc", True), "region": Argument("Region", False)}
            >>> added, removed, modified = [], [], []
            >>> detector._compare_arguments(old_args, new_args, "", added, removed, modified)
            >>> print(added)  # ["region"]
            >>> print(len(modified))  # 1 (description changed)
        """
        old_keys: Set[str] = set(old_args.keys())
        new_keys: Set[str] = set(new_args.keys())
        
        # Detect added arguments
        for arg_name in new_keys - old_keys:
            full_path = f"{path_prefix}{arg_name}"
            added.append(full_path)
        
        # Detect removed arguments
        for arg_name in old_keys - new_keys:
            full_path = f"{path_prefix}{arg_name}"
            removed.append(full_path)
        
        # Compare common arguments
        for arg_name in old_keys & new_keys:
            full_path = f"{path_prefix}{arg_name}"
            old_arg = old_args[arg_name]
            new_arg = new_args[arg_name]
            
            # Compare argument properties
            self._compare_argument_properties(
                full_path,
                old_arg,
                new_arg,
                modified
            )
            
            # Recursively compare nested arguments
            if old_arg.arguments or new_arg.arguments:
                old_nested = old_arg.arguments or {}
                new_nested = new_arg.arguments or {}
                self._compare_arguments(
                    old_nested,
                    new_nested,
                    f"{full_path}.",  # Add dot separator for nested path
                    added,
                    removed,
                    modified
                )
    
    def _compare_argument_properties(
        self,
        argument_path: str,
        old_arg: Argument,
        new_arg: Argument,
        modified: List[ArgumentChange]
    ) -> None:
        """
        Compare properties of two argument objects and track modifications.
        
        This method compares specific fields of arguments that can change:
        description, required status, and deprecated status. It does not compare
        the parent field (which is structural) or security fields (which are
        always None in extracted schemas).
        
        Args:
            argument_path (str): Full path to the argument being compared
            old_arg (Argument): Argument from old version
            new_arg (Argument): Argument from new version
            modified (List[ArgumentChange]): List to append modifications to
        
        Example:
            >>> detector = ResourceChangeDetector()
            >>> old_arg = Argument("Old desc", True, deprecated=False)
            >>> new_arg = Argument("New desc", False, deprecated=True)
            >>> modified = []
            >>> detector._compare_argument_properties("bucket", old_arg, new_arg, modified)
            >>> print(len(modified))  # 3 (description, required, deprecated all changed)
        """
        # Compare description
        if old_arg.description != new_arg.description:
            modified.append(ArgumentChange(
                argument_path=argument_path,
                field="description",
                old_value=old_arg.description,
                new_value=new_arg.description
            ))
        
        # Compare required status
        if old_arg.required != new_arg.required:
            modified.append(ArgumentChange(
                argument_path=argument_path,
                field="required",
                old_value=old_arg.required,
                new_value=new_arg.required
            ))
        
        # Compare deprecated status
        if old_arg.deprecated != new_arg.deprecated:
            modified.append(ArgumentChange(
                argument_path=argument_path,
                field="deprecated",
                old_value=old_arg.deprecated,
                new_value=new_arg.deprecated
            ))
