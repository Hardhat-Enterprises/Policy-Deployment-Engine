"""
Main Orchestrator for Terraform JSON Spec Generator

Coordinates all components to implement the complete generation workflow including:
- Resource extraction from provider documentation
- Batch processing with error isolation
- Change detection and reporting
- Metadata file generation
- Dry-run mode support

The orchestrator wires together all components and implements the main processing
loop with proper error handling and logging.

Example:
    >>> from scripts.docgen_v2.lib import Orchestrator
    >>> from scripts.docgen_v2.lib.cli import parse_arguments
    >>> 
    >>> args = parse_arguments(['--csp', 'aws', '--service', 's3'])
    >>> orchestrator = Orchestrator(args)
    >>> orchestrator.run()

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import sys
from argparse import Namespace
from pathlib import Path
from typing import Dict, List, Optional

from scripts.docgen_v2.lib.logging_config import get_logger
from scripts.docgen_v2.lib.models import Resource
from scripts.docgen_v2.lib.repository_manager import RepositoryManager
from scripts.docgen_v2.lib.schema_extractor import SchemaExtractor
from scripts.docgen_v2.lib.resource_processor import ResourceProcessor
from scripts.docgen_v2.lib.resource_file_manager import (
    ResourceFileManager,
    sanitize_subcategory_for_path,
    get_resource_filename
)
from scripts.docgen_v2.lib.resource_change_detector import ResourceChangeDetector
from scripts.docgen_v2.lib.report_generator import ReportGenerator
from scripts.docgen_v2.lib.metadata_manager import MetadataManager
from scripts.docgen_v2.lib.errors import (
    GeneratorError,
    ParsingError,
    ValidationError,
    FilesystemError,
    EXIT_SUCCESS,
    EXIT_CONFIG_ERROR,
    EXIT_VALIDATION_ERROR,
    fail_fast
)

logger = get_logger(__name__)


class Orchestrator:
    """
    Main orchestrator that coordinates all components for resource generation.
    
    This class implements the complete workflow for extracting Terraform resource
    schemas, generating JSON files, detecting changes, and creating reports.
    
    Attributes:
        args: Parsed command-line arguments
        repo_manager: Repository manager for provider documentation
        schema_extractor: Schema extractor for parsing resources
        resource_processor: Resource processor for validation
        file_manager: File manager for JSON operations
        change_detector: Change detector for version comparison
        report_generator: Report generator for change documentation
        metadata_manager: Metadata manager for run tracking
    
    Example:
        >>> args = parse_arguments(['--csp', 'aws', '--no-dry-run'])
        >>> orchestrator = Orchestrator(args)
        >>> orchestrator.run()
    """
    
    def __init__(self, args: Namespace):
        """
        Initialize the orchestrator with parsed arguments.
        
        Args:
            args: Parsed command-line arguments from argparse
        """
        self.args = args
        
        # Initialize all components
        self.repo_manager = RepositoryManager(cache_dir=args.cache_dir)
        self.schema_extractor = SchemaExtractor(self.repo_manager)
        self.resource_processor = ResourceProcessor()
        self.file_manager = ResourceFileManager()
        self.change_detector = ResourceChangeDetector()
        self.report_generator = ReportGenerator()
        self.metadata_manager = MetadataManager()
        
        # Track statistics
        self.total_processed = 0
        self.total_failed = 0
        self.failed_resources: List[str] = []

        # Track change reports for summary generation
        self.change_reports: List = []  # List[ChangeReport]

        # Track files written and service dirs touched for stale-resource cleanup
        self.processed_files: set = set()
        self.touched_service_dirs: set = set()
        
        logger.info(f"Orchestrator initialized for CSP: {args.csp}")
        if args.dry_run:
            logger.info("Running in DRY-RUN mode - no files will be written")
    
    def run(self) -> int:
        """
        Execute the main processing workflow.
        
        This is the main entry point that coordinates all processing steps:
        1. Determine which resources to process
        2. Extract and process each resource
        3. Detect changes if previous version exists
        4. Generate reports for changes
        5. Write metadata file
        6. Report summary statistics
        
        Returns:
            int: Exit code (0 for success, non-zero for errors)
        
        Example:
            >>> orchestrator = Orchestrator(args)
            >>> exit_code = orchestrator.run()
            >>> sys.exit(exit_code)
        """
        try:
            # Step 0: Clone/access repository and handle version detection/updates
            repo_path = self.repo_manager.clone_provider_repo(
                self.args.csp,
                self.args.provider_version
            )
            
            # Update cache if requested
            if self.args.update_cache:
                self.repo_manager.update_cache(repo_path)
            
            # Auto-detect version if not specified
            if not self.args.provider_version:
                detected_version = self.repo_manager.get_current_version(repo_path)
                logger.info(f"Auto-detected provider version: {detected_version}")
                # Update args with detected version
                self.args.provider_version = detected_version
                
                # Check for updates and warn user if newer version available
                latest_remote = self.repo_manager.check_for_updates(repo_path, detected_version)
                if latest_remote:
                    logger.warning(
                        f"Newer version available: {latest_remote} (using {detected_version}). "
                        f"Run with --update-cache to update."
                    )
            
            # Step 1: Determine which resources to process
            resources_to_process = self._determine_resources_to_process()
            
            if not resources_to_process:
                logger.warning("No resources found to process")
                return 0
            
            logger.info(f"Processing {len(resources_to_process)} resources")
            
            # Step 2: Extract and process resources (batch processing with error isolation)
            extracted_resources = self._batch_extract_resources(resources_to_process)
            
            # Step 3: Get old version for change detection
            old_version = self._get_previous_version()
            
            # Step 4: Process each resource (write files, detect changes, generate reports)
            for resource in extracted_resources:
                self._process_single_resource(resource, old_version)
            
            # Step 4.5: Remove JSON files for resource types no longer in the provider
            self._cleanup_stale_resources()

            # Step 4.6: Generate summary report if there were any changes
            if self.change_reports:
                self._generate_summary_report()
            
            # Step 5: Generate metadata file (if not dry-run)
            if not self.args.dry_run and extracted_resources:
                self._generate_metadata(extracted_resources)
            elif self.args.dry_run:
                logger.info(f"DRY-RUN: Would generate metadata file for {len(extracted_resources)} resources")
            
            # Step 6: Report summary statistics
            self._report_summary()
            
            # Return success if no failures, otherwise return error code
            return EXIT_SUCCESS if self.total_failed == 0 else EXIT_VALIDATION_ERROR
            
        except GeneratorError as e:
            # Known error types - already have proper context
            logger.error(f"Critical error in orchestrator: {e}", exc_info=True)
            e.write_to_stderr()
            return e.exit_code
            
        except Exception as e:
            # Unexpected error - treat as configuration error
            logger.error(f"Unexpected critical error in orchestrator: {e}", exc_info=True)
            sys.stderr.write(f"CRITICAL ERROR: {e}\n")
            return EXIT_CONFIG_ERROR
    
    def _determine_resources_to_process(self) -> List[str]:
        """
        Determine which resources to process based on CLI arguments.
        
        Logic:
        - If --service specified: get all resources in those services
        - Else: get all resources for the CSP
        
        Returns:
            List[str]: List of resource names to process
        """
        # If services are specified, get all resources in those services
        if self.args.service:
            logger.info(f"Processing services: {self.args.service}")
            all_resources = []
            for service in self.args.service:
                service_resources = self.schema_extractor.list_available_resources(
                    self.args.csp,
                    service=service,
                    version=self.args.provider_version
                )
                all_resources.extend(service_resources)
                logger.info(f"Found {len(service_resources)} resources in service '{service}'")
            return all_resources
        
        # Otherwise, get all resources for the CSP
        logger.info(f"Processing all resources for {self.args.csp}")
        return self.schema_extractor.list_available_resources(
            self.args.csp,
            version=self.args.provider_version
        )
    
    def _batch_extract_resources(self, resource_names: List[str]) -> List[Resource]:
        """
        Extract resources in batch with error isolation.
        
        Processes each resource independently. If one fails, logs the error
        and continues with the remaining resources.
        
        Args:
            resource_names: List of resource names to extract
        
        Returns:
            List[Resource]: Successfully extracted resources
        """
        extracted_resources = []
        
        for i, resource_name in enumerate(resource_names, 1):
            logger.info(f"Processing resource {i}/{len(resource_names)}: {resource_name}")
            
            try:
                # Extract resource schema
                resource = self.schema_extractor.extract_resource_schema(
                    self.args.csp,
                    resource_name,
                    self.args.provider_version
                )
                
                if resource is None:
                    raise ParsingError(
                        "Failed to extract schema",
                        resource_name=resource_name,
                        operation="schema extraction"
                    )
                
                # Set parent references
                self.resource_processor.set_parent_references(resource)
                
                # Validate structure
                validation_errors = self.resource_processor.validate_structure(resource)
                if validation_errors:
                    error_msg = f"Validation failed: {'; '.join(validation_errors)}"
                    raise ValidationError(
                        error_msg,
                        resource_name=resource_name,
                        operation="resource validation"
                    )
                
                extracted_resources.append(resource)
                self.total_processed += 1
                
            except (ParsingError, ValidationError, FilesystemError) as e:
                # Error isolation: log resource-specific errors and continue
                self.total_failed += 1
                self.failed_resources.append(resource_name)
                logger.error(f"Failed to process resource {resource_name}: {e}")
                continue
                
            except Exception as e:
                # Unexpected error during resource processing - still isolate but log as unexpected
                self.total_failed += 1
                self.failed_resources.append(resource_name)
                logger.error(f"Unexpected error processing resource {resource_name}: {e}", exc_info=True)
                continue
        
        return extracted_resources
    
    def _get_previous_version(self) -> Optional[str]:
        """
        Get the previous provider version from metadata files.
        
        Used for change detection to determine what version to compare against.
        
        Returns:
            Optional[str]: Previous version string, or None if no previous metadata
        """
        try:
            latest_metadata = self.metadata_manager.get_latest_metadata(
                self.args.output_dir,
                self.args.csp
            )
            
            if latest_metadata:
                logger.info(f"Found previous version: {latest_metadata.version}")
                return latest_metadata.version
            else:
                logger.info("No previous metadata found - this is the first run")
                return None
                
        except Exception as e:
            logger.warning(f"Failed to retrieve previous metadata: {e}")
            return None
    
    def _process_single_resource(self, resource: Resource, old_version: Optional[str]) -> None:
        """
        Process a single resource: write JSON, detect changes, generate reports.
        
        Args:
            resource: Resource object to process
            old_version: Previous provider version for change detection (if any)
        """
        try:
            # Construct file path with sanitized subcategory and filename
            sanitized_subcategory = sanitize_subcategory_for_path(resource.subcategory)
            filename = get_resource_filename(resource.resource_name)
            file_path = self.args.output_dir / self.args.csp / sanitized_subcategory / "resource_json" / filename
            
            # Check if file exists for change detection
            old_resource = None
            if file_path.exists() and old_version:
                logger.debug(f"Loading old resource from {file_path} for change detection (old_version={old_version})")
                old_resource = self.file_manager.read_existing_json(file_path)
                if old_resource:
                    old_resource.version = old_version  # Set version from metadata
                    logger.debug(f"Loaded old resource: {old_resource.resource_name} v{old_resource.version}")
                else:
                    logger.warning(f"Failed to load old resource from {file_path}")
            else:
                if not file_path.exists():
                    logger.debug(f"No existing file at {file_path} - skipping change detection")
                if not old_version:
                    logger.debug(f"No old_version available - skipping change detection")
            
            # Detect changes if we have an old version
            if old_resource and resource.version:
                logger.debug(f"Detecting changes: {old_resource.version} -> {resource.version}")
                change_report = self.change_detector.detect_changes(old_resource, resource)
                
                # Generate report if there are changes
                if change_report.has_changes():
                    logger.info(f"Changes detected for {resource.resource_name}: "
                               f"{len(change_report.added_arguments)} added, "
                               f"{len(change_report.removed_arguments)} removed, "
                               f"{len(change_report.modified_arguments)} modified")
                    self._generate_change_report(change_report)
                else:
                    logger.debug(f"No changes detected for {resource.resource_name}")
            else:
                if not old_resource:
                    logger.debug(f"No old_resource - skipping change detection for {resource.resource_name}")
                if not resource.version:
                    logger.debug(f"No resource.version - skipping change detection for {resource.resource_name}")
            
            # Track for stale-resource cleanup
            self.processed_files.add(file_path)
            self.touched_service_dirs.add(file_path.parent)

            # Write resource JSON file (or log in dry-run mode)
            if self.args.dry_run:
                logger.info(f"DRY-RUN: Would write {file_path}")
            else:
                self.file_manager.write_resource_json(resource, self.args.output_dir)
                logger.info(f"Wrote resource JSON: {file_path}")
                
        except Exception as e:
            logger.error(f"Error processing resource {resource.resource_name}: {e}")
            self.total_failed += 1
            self.failed_resources.append(resource.resource_name)
    
    def _generate_change_report(self, change_report) -> None:
        """
        Generate and write change report for a resource.
        
        Args:
            change_report: ChangeReport object with detected changes
        """
        try:
            # Track change report for summary generation
            self.change_reports.append(change_report)
            
            # Generate report content
            report_content = self.report_generator.generate_resource_report(change_report)
            
            # Construct report path
            version_dir = f"{change_report.old_version}-to-{change_report.new_version}"
            report_path = (
                self.args.output_dir / 
                self.args.csp / 
                "_changes" / 
                version_dir / 
                f"{change_report.resource_name}.md"
            )
            
            # Write report (or log in dry-run mode)
            if self.args.dry_run:
                logger.info(f"DRY-RUN: Would write change report to {report_path}")
            else:
                self.report_generator.write_report(report_path, report_content)
                logger.info(f"Generated change report: {report_path}")
                
        except Exception as e:
            logger.warning(f"Failed to generate change report for {change_report.resource_name}: {e}")
    
    def _generate_summary_report(self) -> None:
        """
        Generate and write summary report for all changes in this run.
        
        Uses the accumulated change_reports list to create a summary markdown file
        listing all resources that changed and overall statistics.
        """
        if not self.change_reports:
            logger.debug("No change reports to summarize")
            return
        
        try:
            # Generate summary content
            summary_content = self.report_generator.generate_summary_report(self.change_reports)
            
            # Use the first change report to get version info (all should have same versions)
            first_report = self.change_reports[0]
            version_dir = f"{first_report.old_version}-to-{first_report.new_version}"
            
            # Construct summary report path
            summary_path = (
                self.args.output_dir / 
                self.args.csp / 
                "_changes" / 
                version_dir / 
                "summary.md"
            )
            
            # Write summary report (or log in dry-run mode)
            if self.args.dry_run:
                logger.info(f"DRY-RUN: Would write summary report to {summary_path}")
            else:
                self.report_generator.write_report(summary_path, summary_content)
                logger.info(f"Generated summary report: {summary_path} ({len(self.change_reports)} resources changed)")
                
        except Exception as e:
            logger.warning(f"Failed to generate summary report: {e}")
    
    def _generate_metadata(self, resources: List[Resource]) -> None:
        """
        Generate and write metadata file for this run.
        
        Args:
            resources: List of successfully processed resources
        """
        try:
            # Create metadata object
            metadata = self.metadata_manager.create_run_metadata(
                self.args.csp,
                self.args.provider_version,  # Version is now always set (either specified or auto-detected)
                resources,
                dry_run=self.args.dry_run
            )
            
            # Write metadata file
            metadata_path = self.metadata_manager.write_metadata_file(
                self.args.output_dir,
                self.args.csp,
                metadata
            )
            
            logger.info(f"Generated metadata file: {metadata_path}")
            
        except Exception as e:
            logger.error(f"Failed to generate metadata file: {e}")
    
    def _cleanup_stale_resources(self) -> None:
        """Delete JSON files for resource types that no longer exist in the provider."""
        for service_dir in self.touched_service_dirs:
            if not service_dir.exists():
                continue
            for json_file in service_dir.glob('*.json'):
                if json_file not in self.processed_files:
                    if self.args.dry_run:
                        logger.info(f"DRY-RUN: Would delete stale resource file: {json_file}")
                    else:
                        json_file.unlink()
                        logger.info(f"Deleted stale resource file: {json_file}")

    def _report_summary(self) -> None:
        """
        Report summary statistics for the processing run.
        
        Logs total resources processed, failures, and success rate.
        """
        total_attempted = self.total_processed + self.total_failed
        success_rate = (self.total_processed / total_attempted * 100) if total_attempted > 0 else 0
        
        logger.info("=" * 70)
        logger.info("PROCESSING SUMMARY")
        logger.info("=" * 70)
        logger.info(f"Total resources attempted: {total_attempted}")
        logger.info(f"Successfully processed: {self.total_processed}")
        logger.info(f"Failed: {self.total_failed}")
        logger.info(f"Success rate: {success_rate:.1f}%")
        
        if self.failed_resources:
            logger.warning(f"Failed resources: {', '.join(self.failed_resources)}")
        
        logger.info("=" * 70)
