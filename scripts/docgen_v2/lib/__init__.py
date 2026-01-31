"""
Terraform JSON Spec Generator Library

This package contains all the core library modules for the Terraform JSON
Spec Generator. The library is organized into focused modules that handle
different aspects of the generation pipeline.

Modules:
    models: Data models (Resource, Argument, ChangeReport, etc.)
    parser: Markdown parsing for Terraform provider documentation
    logging_config: Logging configuration and setup
    cli: Command-line argument parsing
    repository_manager: Git repository management for provider docs
    schema_extractor: Schema extraction coordination
    resource_processor: Resource validation and enrichment
    resource_file_manager: JSON file operations
    resource_change_detector: Version comparison and change detection
    report_generator: Change report generation
    metadata_manager: Metadata file management
    orchestrator: Main orchestration and workflow coordination

Example:
    >>> from scripts.docgen_v2.lib import Orchestrator
    >>> from scripts.docgen_v2.lib.cli import parse_arguments
    >>> 
    >>> args = parse_arguments()
    >>> orchestrator = Orchestrator(args)
    >>> orchestrator.run()

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

# Import key classes for convenient access
from scripts.docgen_v2.lib.models import (
    Resource,
    Argument,
    ChangeReport,
    ArgumentChange,
    RunMetadata,
    Statistics
)
from scripts.docgen_v2.lib.cli import parse_arguments
from scripts.docgen_v2.lib.repository_manager import RepositoryManager
from scripts.docgen_v2.lib.schema_extractor import SchemaExtractor
from scripts.docgen_v2.lib.resource_processor import ResourceProcessor
from scripts.docgen_v2.lib.resource_file_manager import ResourceFileManager
from scripts.docgen_v2.lib.resource_change_detector import ResourceChangeDetector
from scripts.docgen_v2.lib.report_generator import ReportGenerator
from scripts.docgen_v2.lib.metadata_manager import MetadataManager
from scripts.docgen_v2.lib.orchestrator import Orchestrator

__all__ = [
    'Resource',
    'Argument',
    'ChangeReport',
    'ArgumentChange',
    'RunMetadata',
    'Statistics',
    'parse_arguments',
    'RepositoryManager',
    'SchemaExtractor',
    'ResourceProcessor',
    'ResourceFileManager',
    'ResourceChangeDetector',
    'ReportGenerator',
    'MetadataManager',
    'Orchestrator',
]
