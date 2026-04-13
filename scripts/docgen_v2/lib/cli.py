"""
CLI argument parsing for the Terraform JSON Spec Generator.

Provides command-line interface with argparse for configuring the generator's
behavior including CSP selection, service/resource filtering, output location,
and execution modes.

Features:
    - Required CSP selection (aws, azure, gcp)
    - Optional service and resource filtering
    - Configurable output directory
    - Dry-run mode by default for safety
    - Silent mode to suppress console output
    - Comprehensive validation of argument combinations

Example:
    >>> from scripts.docgen_v2.cli import parse_arguments
    >>> args = parse_arguments()
    >>> print(args.csp)  # 'aws'
    >>> print(args.dry_run)  # True (default)

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import argparse
import sys
from pathlib import Path
from typing import Optional, List

from scripts.docgen_v2.lib.errors import ConfigurationError, EXIT_CONFIG_ERROR


def parse_arguments(args: Optional[List[str]] = None) -> argparse.Namespace:
    """
    Parse and validate command-line arguments with type hints.
    
    Creates an argument parser with all required and optional flags for
    configuring the generator. Performs basic argparse validation and
    then calls validate_arguments() for custom validation rules.
    
    Args:
        args: Optional list of argument strings. If None, uses sys.argv.
              Primarily used for testing.
    
    Returns:
        argparse.Namespace: Parsed arguments with the following attributes:
            - csp (str): Cloud service provider ('aws', 'azure', or 'gcp')
            - service (Optional[List[str]]): Service name(s) to process
            - provider_version (Optional[str]): Terraform provider version
            - output_dir (Path): Base output directory
            - cache_dir (Path): Cache directory for provider repositories
            - dry_run (bool): Whether to run in dry-run mode
            - silent (bool): Whether to suppress console output (errors still shown)
    
    Raises:
        SystemExit: If arguments are invalid or validation fails
    
    Example:
        >>> args = parse_arguments(['--csp', 'aws', '--no-dry-run'])
        >>> print(args.csp)  # 'aws'
        >>> print(args.dry_run)  # False
    
    Note:
        - Dry-run mode is enabled by default for safety
        - Use --no-dry-run to actually write files
    """
    parser = argparse.ArgumentParser(
        description='Generate Terraform JSON specification files from provider schemas',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Dry-run (default) - process all AWS services
  python generator.py --csp aws
  
  # Execute - process all AWS services (writes files)
  python generator.py --csp aws --no-dry-run
  
  # Process specific services
  python generator.py --csp aws --service s3 ec2 --no-dry-run
  
  # Process with specific provider version
  python generator.py --csp aws --provider-version 5.70.0 --no-dry-run
  
  # Use custom cache directory
  python generator.py --csp aws --cache-dir /tmp/terraform-cache --no-dry-run
        """
    )
    
    # Required arguments
    parser.add_argument(
        '--csp',
        type=str,
        required=True,
        choices=['aws', 'azure', 'gcp'],
        help='Cloud service provider (aws, azure, or gcp)'
    )
    
    # Optional arguments
    parser.add_argument(
        '--service',
        type=str,
        nargs='+',
        help='Service name(s) to process (space-separated). If not provided, processes ALL services.'
    )
    
    parser.add_argument(
        '--provider-version',
        type=str,
        dest='provider_version',
        help='Terraform provider version (e.g., 5.0.0)'
    )
    
    parser.add_argument(
        '--output-dir',
        type=Path,
        dest='output_dir',
        default=Path('docs/'),
        help='Base output directory (default: docs/)'
    )
    
    parser.add_argument(
        '--cache-dir',
        type=Path,
        dest='cache_dir',
        default=None,  # Will be set to default in validation if None
        help='Cache directory for provider repositories (default: scripts/docgen_v2/.cache/)'
    )
    
    # Execution mode - dry-run by default
    parser.add_argument(
        '--dry-run',
        dest='dry_run',
        action='store_true',
        default=True,
        help='Simulate operations without writing files (DEFAULT)'
    )
    parser.add_argument(
        '--no-dry-run',
        dest='dry_run',
        action='store_false',
        help='Execute and write files'
    )
    
    parser.add_argument(
        '--silent',
        action='store_true',
        default=False,
        help='Suppress console output (errors still shown to stderr)'
    )
    
    parser.add_argument(
        '--update-cache',
        dest='update_cache',
        action='store_true',
        default=False,
        help='Update cached provider repositories from remote before processing'
    )
    
    parsed_args = parser.parse_args(args)
    
    # Custom validation
    validate_arguments(parsed_args)
    
    return parsed_args


def validate_arguments(args: argparse.Namespace) -> None:
    """
    Perform custom validation on parsed arguments.
    
    Validates argument combinations and constraints that cannot be expressed
    through argparse's built-in validation. Writes errors to stderr and exits
    with code 1 (configuration error) if validation fails.
    
    Args:
        args: Parsed arguments from argparse
    
    Raises:
        SystemExit: If validation fails, exits with code 1
    
    Validation Rules:
        1. Output directory must not exist as a file (if it exists, must be a directory)
        2. In non-dry-run mode, output directory parent must be writable
        3. Sets default cache directory if not provided
    
    Example:
        >>> args = argparse.Namespace(resource=['aws_s3_bucket'], service=None)
        >>> validate_arguments(args)  # Exits with error
    
    Note:
        Validation errors are written to stderr with detailed context
        to help users understand and fix the issue.
    """
    # Set default cache directory if not provided
    if args.cache_dir is None:
        # Default to scripts/docgen_v2/.cache/ relative to project root
        # Find the project root by going up from this file's location
        current_file = Path(__file__)  # scripts/docgen_v2/lib/cli.py
        docgen_v2_dir = current_file.parent.parent  # Go up 2 levels to scripts/docgen_v2/
        args.cache_dir = docgen_v2_dir / '.cache'
    
    # Validate output directory is not a file
    output_dir = args.output_dir
    if output_dir.exists() and not output_dir.is_dir():
        error = ConfigurationError(
            "Output path exists but is not a directory. "
            "Please specify a valid directory path or remove the existing file.",
            file_path=str(output_dir),
            operation="output directory validation"
        )
        error.write_to_stderr()
        sys.exit(EXIT_CONFIG_ERROR)
    
    # In non-dry-run mode, check if we can write to output directory
    if not args.dry_run:
        # Check if parent directory exists and is writable
        if not output_dir.exists():
            parent = output_dir.parent
            if not parent.exists():
                error = ConfigurationError(
                    "Parent directory does not exist. Please create the parent directory first.",
                    file_path=str(parent),
                    operation="output directory validation"
                )
                error.write_to_stderr()
                sys.exit(EXIT_CONFIG_ERROR)
            if not parent.is_dir():
                error = ConfigurationError(
                    "Parent path is not a directory.",
                    file_path=str(parent),
                    operation="output directory validation"
                )
                error.write_to_stderr()
                sys.exit(EXIT_CONFIG_ERROR)
    
    # Log mode for user clarity
    if args.dry_run:
        print("Running in DRY-RUN mode (no files will be written). Use --no-dry-run to write files.")
