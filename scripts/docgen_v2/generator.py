#!/usr/bin/env python3
"""
Terraform JSON Spec Generator - Main Entry Point

This script is the main entry point for the Terraform JSON Spec Generator.
It extracts resource schema information from Terraform provider documentation
and generates standardized JSON specification files organized by cloud service
provider and service.

The generator supports:
    - Multiple cloud providers (AWS, Azure, GCP)
    - Batch processing of resources with error isolation
    - Provider version tracking and change detection
    - Dry-run mode for validation without file system changes
    - Comprehensive error handling with detailed context

Usage:
    # Dry-run mode (default) - validate without writing files
    python generator.py --csp aws
    
    # Execute mode - process all AWS services and write files
    python generator.py --csp aws --no-dry-run
    
    # Process specific services
    python generator.py --csp aws --service s3 ec2 --no-dry-run
    
    # Process with specific provider version
    python generator.py --csp aws --provider-version 5.70.0 --no-dry-run
    
    # Suppress console output (silent mode)
    python generator.py --csp aws --silent

Exit Codes:
    0: Success - all resources processed successfully
    1: Configuration error - invalid arguments or configuration
    2: Connection error - unable to access provider documentation
    3: Parsing error - malformed provider documentation
    4: Filesystem error - unable to create directories or write files
    5: Validation error - generated JSON fails validation checks

Output Structure:
    docs/{csp}/{sanitized_subcategory}/resource_json/{resource_name_without_prefix}.template.json
    docs/{csp}/metadata.{timestamp}.json
    docs/{csp}/changes/{old_ver}-to-{new_ver}/{resource_name}.md
    
    Note: 
    - Subcategories with spaces are sanitized (e.g., "S3 (Simple Storage)" → "S3_(Simple_Storage)")
    - Resource filenames omit CSP prefix (e.g., "s3_bucket.template.json" instead of "aws_s3_bucket.template.json")

Features:
    - Extracts complete resource schemas including nested arguments
    - Tracks required/optional flags and deprecation status
    - Detects changes between provider versions
    - Generates human-readable change reports
    - Maintains metadata history with timestamps
    - Supports dry-run mode for safe validation

Requirements:
    - Python 3.8+
    - Git (for cloning provider repositories)
    - Internet connection (for first-time repository cloning)

Cache:
    Provider repositories are cached at scripts/docgen_v2/.cache/
    To refresh cached documentation, delete the cache directory and re-run.

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from scripts.docgen_v2.lib.cli import parse_arguments
from scripts.docgen_v2.lib.logging_config import setup_logging, get_logger
from scripts.docgen_v2.lib.orchestrator import Orchestrator
from scripts.docgen_v2.lib.errors import (
    GeneratorError,
    EXIT_SUCCESS,
    EXIT_CONFIG_ERROR
)


def main() -> int:
    """
    Main entry point for the Terraform JSON Spec Generator.
    
    This function orchestrates the complete workflow:
    1. Parse and validate command-line arguments
    2. Set up logging based on verbosity level
    3. Initialize the orchestrator with all components
    4. Execute the generation workflow
    5. Handle errors and return appropriate exit codes
    
    Returns:
        int: Exit code (0 for success, non-zero for errors)
    
    Example:
        >>> exit_code = main()
        >>> sys.exit(exit_code)
    
    Note:
        All errors are written to stderr with detailed context.
        Detailed DEBUG logs are always written to the log file.
        Use --silent flag to suppress console output.
    """
    try:
        # Step 1: Parse command-line arguments
        # This will exit with code 1 if arguments are invalid
        args = parse_arguments()
        
        # Step 2: Set up logging
        # Console: INFO+ (or silent), File: DEBUG+
        log_file = setup_logging(silent=args.silent)
        
        logger = get_logger(__name__)
        logger.info("=" * 70)
        logger.info("Terraform JSON Spec Generator")
        logger.info("=" * 70)
        logger.info(f"CSP: {args.csp}")
        logger.info(f"Output directory: {args.output_dir}")
        logger.info(f"Cache directory: {args.cache_dir}")
        logger.info(f"Provider version: {args.provider_version or 'latest'}")
        logger.info(f"Dry-run mode: {args.dry_run}")
        
        if args.service:
            logger.info(f"Services: {', '.join(args.service)}")
        else:
            logger.info("Services: ALL")
        
        logger.info("=" * 70)
        
        # Step 3: Initialize orchestrator with all components
        orchestrator = Orchestrator(args)
        
        # Step 4: Execute the generation workflow
        exit_code = orchestrator.run()
        
        # Step 5: Log completion and return exit code
        if exit_code == EXIT_SUCCESS:
            logger.info("Generation completed successfully")
        else:
            logger.error(f"Generation completed with errors (exit code: {exit_code})")
        
        return exit_code
        
    except GeneratorError as e:
        # Known error types - already have proper context and formatting
        logger = get_logger(__name__)
        logger.error(f"Critical error: {e}", exc_info=True)
        e.write_to_stderr()
        return e.exit_code
        
    except KeyboardInterrupt:
        # User interrupted execution
        logger = get_logger(__name__)
        logger.warning("Execution interrupted by user")
        sys.stderr.write("\nExecution interrupted by user\n")
        return EXIT_CONFIG_ERROR
        
    except Exception as e:
        # Unexpected error - treat as configuration error
        logger = get_logger(__name__)
        logger.error(f"Unexpected critical error: {e}", exc_info=True)
        sys.stderr.write(f"CRITICAL ERROR: {e}\n")
        sys.stderr.write("This is an unexpected error. Please report this issue.\n")
        return EXIT_CONFIG_ERROR


if __name__ == "__main__":
    """
    Script entry point when executed directly.
    
    Calls main() and exits with the returned exit code.
    This ensures proper exit code propagation to the shell.
    """
    exit_code = main()
    sys.exit(exit_code)
