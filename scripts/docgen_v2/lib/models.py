"""
Data models for Terraform resource schemas.

Defines the core data structures used throughout the generator:
- Argument: Represents a single resource argument with metadata
- Resource: Represents a complete Terraform resource with all arguments
- RunMetadata: Represents metadata about a generation run
- Statistics: Represents statistics about generated resources
- ChangeReport: Represents changes between resource versions
- ArgumentChange: Represents a single field change in an argument

These models are used both during extraction from provider documentation
and for JSON serialization to output files.
"""

from dataclasses import dataclass
from typing import Any, Dict, List, Optional


@dataclass
class Argument:
    """
    Represents a Terraform resource argument with all its metadata.
    
    This class encapsulates all information about a single argument including
    its description, requirements, deprecation status, and any nested arguments.
    
    Attributes:
        description (str): Human-readable description of the argument
        required (Optional[bool]): True if required, False if optional, None if unknown
        parent (Optional[str]): Name of parent argument if this is nested, None for top-level
        deprecated (bool): True if argument is deprecated (either individually or via resource)
        security_impact (Optional[str]): Security impact assessment (reserved for future use)
        rationale (Optional[str]): Rationale for security assessment (reserved for future use)
        compliant (Optional[str]): Compliance information (reserved for future use)
        non_compliant (Optional[str]): Non-compliance information (reserved for future use)
        arguments (Optional[Dict[str, 'Argument']]): Nested arguments if this is a complex type
    
    Note:
        The security_impact, rationale, compliant, and non_compliant fields are
        reserved for future use and are always set to None in the current implementation.
    """
    description: str
    required: Optional[bool]
    parent: Optional[str] = None
    deprecated: bool = False
    security_impact: Optional[str] = None
    rationale: Optional[str] = None
    compliant: Optional[str] = None
    non_compliant: Optional[str] = None
    arguments: Optional[Dict[str, 'Argument']] = None
    
    def to_json_dict(self) -> Dict:
        """
        Convert argument to dictionary for JSON serialization.
        
        Creates a dictionary representation suitable for JSON output that matches
        the specification requirements. Recursively converts nested arguments.
        
        Returns:
            Dict: Dictionary containing all argument fields, with nested arguments
                 converted to dictionaries as well
        
        Example:
            >>> arg = Argument(description="Test arg", required=True)
            >>> result = arg.to_json_dict()
            >>> print(result['description'])  # "Test arg"
            >>> print(result['required'])     # True
        """
        result = {
            'description': self.description,
            'required': self.required,
            'deprecated': self.deprecated,
            'security_impact': self.security_impact,
            'rationale': self.rationale,
            'compliant': self.compliant,
            'non_compliant': self.non_compliant,
            'parent': self.parent
        }
        
        # Recursively convert nested arguments
        if self.arguments:
            result['arguments'] = {k: v.to_json_dict() for k, v in self.arguments.items()}
        
        return result


@dataclass
class Resource:
    """
    Represents a complete Terraform resource with all its arguments.
    
    This class encapsulates a Terraform resource including its name, service
    categorization, and all arguments (both top-level and nested).
    
    Attributes:
        resource_name (str): Full resource name (e.g., 'aws_s3_bucket', 'azurerm_storage_account')
        subcategory (str): Service category from YAML front matter (e.g., 'S3 (Simple Storage)')
        arguments (Dict[str, Argument]): Dictionary of all top-level arguments
        provider (Optional[str]): Cloud provider identifier (e.g., 'aws', 'azure', 'gcp')
        version (Optional[str]): Provider version used for extraction (e.g., '5.0.0')
    
    Note:
        The provider and version fields are metadata used during processing but not
        serialized to the output JSON files. They are used for:
        - Change detection between provider versions
        - Logging and reporting
        - Metadata file generation
    
    Example:
        >>> resource = Resource(
        ...     resource_name="aws_s3_bucket",
        ...     subcategory="S3 (Simple Storage)",
        ...     arguments={"bucket": Argument(description="Bucket name", required=False)},
        ...     provider="aws",
        ...     version="5.0.0"
        ... )
    """
    resource_name: str
    subcategory: str
    arguments: Dict[str, Argument]
    provider: Optional[str] = None
    version: Optional[str] = None
    
    def to_json_dict(self) -> Dict:
        """
        Convert resource to dictionary for JSON serialization with metadata block.
        
        Creates a dictionary representation that matches the specification
        requirements for the final JSON output files. Includes a _metadata block
        containing provider, version, and generation timestamp to help users
        identify which provider version generated the file.
        
        Returns:
            Dict: Dictionary containing _metadata block, resource_name, subcategory,
                 and all arguments converted to dictionaries
        
        Example:
            >>> resource = Resource("aws_s3_bucket", "S3", {"bucket": arg}, "aws", "6.23.0")
            >>> result = resource.to_json_dict()
            >>> print(result.keys())  # dict_keys(['_metadata', 'resource_name', 'subcategory', 'arguments'])
            >>> print(result['_metadata']['provider'])  # 'aws'
            >>> print(result['_metadata']['version'])   # '6.23.0'
        """
        from datetime import datetime, timezone
        
        return {
            '_metadata': {
                'provider': self.provider,
                'version': self.version,
                'generated_at': datetime.now(timezone.utc).isoformat()
            },
            'resource_name': self.resource_name,
            'subcategory': self.subcategory,
            'arguments': {k: v.to_json_dict() for k, v in self.arguments.items()}
        }


@dataclass
class Statistics:
    """
    Statistics about generated resources in a run.
    
    Attributes:
        total_services (int): Total number of services processed
        total_resources (int): Total number of resources generated
    
    Example:
        >>> stats = Statistics(total_services=2, total_resources=10)
        >>> print(stats.total_services)  # 2
    """
    total_services: int
    total_resources: int
    
    def to_json_dict(self) -> Dict:
        """
        Convert statistics to dictionary for JSON serialization.
        
        Returns:
            Dict: Dictionary containing total_services and total_resources
        
        Example:
            >>> stats = Statistics(total_services=2, total_resources=10)
            >>> result = stats.to_json_dict()
            >>> print(result)  # {'total_services': 2, 'total_resources': 10}
        """
        return {
            'total_services': self.total_services,
            'total_resources': self.total_resources
        }


@dataclass
class RunMetadata:
    """
    Metadata about a Terraform resource generation run.
    
    This class encapsulates information about a complete generation run including
    the provider version, timestamp, resources processed, and statistics.
    
    Attributes:
        provider (str): Cloud provider identifier (e.g., 'aws', 'azure', 'gcp')
        version (str): Provider version used for extraction (e.g., '5.0.0')
        generated_at (str): ISO 8601 timestamp of when generation occurred
        resources (Dict[str, List[str]]): Mapping of service names to lists of resource names
        statistics (Statistics): Statistics about the generation run
        dry_run (bool): Whether this was a dry-run (no files written). Defaults to False.
    
    Example:
        >>> stats = Statistics(total_services=1, total_resources=2)
        >>> metadata = RunMetadata(
        ...     provider="aws",
        ...     version="5.0.0",
        ...     generated_at="2024-11-28T10:30:00Z",
        ...     resources={"S3": ["aws_s3_bucket", "aws_s3_object"]},
        ...     statistics=stats,
        ...     dry_run=False
        ... )
    """
    provider: str
    version: str
    generated_at: str  # ISO 8601 timestamp
    resources: Dict[str, List[str]]  # service_name -> list of resource names
    statistics: Statistics
    dry_run: bool = False
    
    def to_json_dict(self) -> Dict:
        """
        Convert metadata to dictionary for JSON serialization.
        
        Returns:
            Dict: Dictionary containing all metadata fields with statistics
                 converted to dictionary as well
        
        Example:
            >>> stats = Statistics(total_services=1, total_resources=2)
            >>> metadata = RunMetadata("aws", "5.0.0", "2024-11-28T10:30:00Z", 
            ...                        {"S3": ["aws_s3_bucket"]}, stats, False)
            >>> result = metadata.to_json_dict()
            >>> print(result.keys())  # dict_keys(['dry_run', 'provider', 'version', 'generated_at', 'resources', 'statistics'])
        """
        return {
            'dry_run': self.dry_run,
            'provider': self.provider,
            'version': self.version,
            'generated_at': self.generated_at,
            'resources': self.resources,
            'statistics': self.statistics.to_json_dict()
        }
    
    def get_filename(self) -> str:
        """
        Generate filename with timestamp for this metadata.
        
        Converts the ISO 8601 timestamp to a filesystem-safe format by replacing
        colons with hyphens, then creates a filename following the pattern
        {timestamp}.json
        
        Returns:
            str: Filename in format {safe_timestamp}.json
        
        Example:
            >>> metadata = RunMetadata("aws", "5.0.0", "2024-11-28T10:30:00.123456Z", {}, Statistics(0, 0))
            >>> print(metadata.get_filename())  # 2024-11-28T10-30-00.123456Z.json
        """
        # Convert timestamp to filesystem-safe format
        safe_timestamp = self.generated_at.replace(':', '-')
        return f"{safe_timestamp}.json"


@dataclass
class ArgumentChange:
    """
    Represents a single field change in an argument between versions.
    
    This class captures a specific change to an argument field, including
    the full path to the argument (for nested arguments), which field changed,
    and the old and new values.
    
    Attributes:
        argument_path (str): Full path to the argument (e.g., 'bucket' or 'logging.target_bucket')
        field (str): Name of the field that changed (e.g., 'description', 'required', 'deprecated')
        old_value (Any): Previous value of the field
        new_value (Any): New value of the field
    
    Example:
        >>> change = ArgumentChange(
        ...     argument_path="bucket",
        ...     field="required",
        ...     old_value=True,
        ...     new_value=False
        ... )
        >>> print(f"{change.argument_path}.{change.field}: {change.old_value} -> {change.new_value}")
        # bucket.required: True -> False
    """
    argument_path: str
    field: str
    old_value: Any
    new_value: Any


@dataclass
class ChangeReport:
    """
    Represents changes between two versions of a Terraform resource.
    
    This class encapsulates all detected changes when comparing an old and new
    version of a resource, including added arguments, removed arguments, and
    modifications to existing arguments.
    
    Attributes:
        resource_name (str): Name of the resource being compared
        old_version (Optional[str]): Previous provider version (e.g., '5.0.0')
        new_version (Optional[str]): New provider version (e.g., '5.1.0')
        added_arguments (List[str]): List of argument paths that were added
        removed_arguments (List[str]): List of argument paths that were removed
        modified_arguments (List[ArgumentChange]): List of argument field changes
    
    Example:
        >>> report = ChangeReport(
        ...     resource_name="aws_s3_bucket",
        ...     old_version="5.0.0",
        ...     new_version="5.1.0",
        ...     added_arguments=["new_field"],
        ...     removed_arguments=["old_field"],
        ...     modified_arguments=[
        ...         ArgumentChange("bucket", "required", True, False)
        ...     ]
        ... )
        >>> print(f"Changes in {report.resource_name}: {len(report.added_arguments)} added")
        # Changes in aws_s3_bucket: 1 added
    """
    resource_name: str
    old_version: Optional[str]
    new_version: Optional[str]
    added_arguments: List[str]
    removed_arguments: List[str]
    modified_arguments: List[ArgumentChange]
    
    def has_changes(self) -> bool:
        """
        Check if this report contains any changes.
        
        Returns:
            bool: True if there are any added, removed, or modified arguments
        
        Example:
            >>> report = ChangeReport("aws_s3_bucket", "5.0.0", "5.1.0", [], [], [])
            >>> print(report.has_changes())  # False
            >>> report.added_arguments.append("new_field")
            >>> print(report.has_changes())  # True
        """
        return bool(
            self.added_arguments or 
            self.removed_arguments or 
            self.modified_arguments
        )
