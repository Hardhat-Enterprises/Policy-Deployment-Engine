"""
Data models for Terraform resource schemas.

Defines the core data structures produced by the markdown parser
(``scripts/docgen/lib/parser.py``):
- Argument: Represents a single resource argument with metadata
- Resource: Represents a complete Terraform resource with all arguments
"""

from dataclasses import dataclass
from typing import Dict, Optional


@dataclass
class Argument:
    """
    Represents a Terraform resource argument with all its metadata.

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


@dataclass
class Resource:
    """
    Represents a complete Terraform resource with all its arguments.

    Attributes:
        resource_name (str): Full resource name (e.g., 'aws_s3_bucket')
        subcategory (str): Service category from YAML front matter (e.g., 'S3 (Simple Storage)')
        arguments (Dict[str, Argument]): Dictionary of all top-level arguments
        provider (Optional[str]): Cloud provider identifier (e.g., 'aws', 'azure', 'gcp')
        version (Optional[str]): Provider version used for extraction (e.g., '5.0.0')
    """
    resource_name: str
    subcategory: str
    arguments: Dict[str, Argument]
    provider: Optional[str] = None
    version: Optional[str] = None
