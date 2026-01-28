"""
Terraform JSON Spec Generator

A tool for extracting Terraform resource schemas from provider documentation
and generating standardized JSON specification files.

This package provides functionality to:
- Parse Terraform provider markdown documentation
- Extract resource schemas with nested arguments
- Handle deprecation tracking at both resource and argument levels
- Generate structured JSON output files
- Support AWS, Azure, and GCP providers

Main Components:
    - models: Data models (Resource, Argument) for representing schemas
    - parser: Markdown parsing functions for extracting schema information
    - logging_config: Logging configuration utilities

Example:
    >>> from scripts.docgen_v2.parser import parse_resource_markdown
    >>> from pathlib import Path
    >>> resource = parse_resource_markdown(Path('aws_s3_bucket.html.markdown'))
    >>> print(resource.resource_name)
"""

__version__ = "1.0.0"
__author__ = "Terraform JSON Spec Generator Team"

from scripts.docgen_v2.lib.models import Resource, Argument
from scripts.docgen_v2.lib.logging_config import setup_logging

__all__ = ["Resource", "Argument", "setup_logging"]
