"""
Metadata Manager for tracking generation runs.

This module provides functionality for creating, writing, and retrieving
metadata files that track Terraform resource generation runs. Metadata files
include provider version, timestamp, resources processed, and statistics.

Classes:
    MetadataManager: Manages metadata file operations
"""

import json
import re
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional

from scripts.docgen_v2.lib.models import Resource, RunMetadata, Statistics
from scripts.docgen_v2.lib.errors import FilesystemError


class MetadataManager:
    """
    Manages metadata files for tracking generation runs.
    
    This class handles creating metadata objects, writing timestamped metadata
    files, listing existing metadata files, and retrieving the most recent
    metadata for change detection purposes.
    
    Metadata files are stored at: docs/{csp}/_history/{timestamp}.json
    where timestamp is in ISO 8601 format with colons replaced by hyphens
    for filesystem compatibility.
    
    Example:
        >>> manager = MetadataManager()
        >>> resources = [Resource("aws_s3_bucket", "S3", {}, "aws", "5.0.0")]
        >>> metadata = manager.create_run_metadata("aws", "5.0.0", resources)
        >>> path = manager.write_metadata_file(Path("docs"), "aws", metadata)
        >>> print(path)  # docs/aws/_history/2024-11-28T10-30-00Z.json
    """
    
    def create_run_metadata(
        self,
        csp: str,
        version: str,
        resources: List[Resource],
        dry_run: bool = False
    ) -> RunMetadata:
        """
        Create a RunMetadata object from a list of resources.
        
        Organizes resources by their subcategory (service name) and calculates
        statistics about the generation run. Uses the current UTC time as the
        generation timestamp in ISO 8601 format.
        
        Args:
            csp: Cloud service provider identifier (e.g., 'aws', 'azure', 'gcp')
            version: Provider version used for extraction (e.g., '5.0.0')
            resources: List of Resource objects that were generated
            dry_run: Whether this was a dry-run (no files written). Defaults to False.
        
        Returns:
            RunMetadata: Metadata object containing all run information
        
        Example:
            >>> manager = MetadataManager()
            >>> resources = [
            ...     Resource("aws_s3_bucket", "S3", {}, "aws", "5.0.0"),
            ...     Resource("aws_s3_object", "S3", {}, "aws", "5.0.0"),
            ...     Resource("aws_ec2_instance", "EC2", {}, "aws", "5.0.0")
            ... ]
            >>> metadata = manager.create_run_metadata("aws", "5.0.0", resources)
            >>> print(metadata.statistics.total_services)  # 2
            >>> print(metadata.statistics.total_resources)  # 3
        """
        # Get current timestamp in ISO 8601 format (with microseconds for uniqueness)
        # Microseconds ensure unique filenames even when runs happen in quick succession
        generated_at = datetime.utcnow().isoformat() + 'Z'
        
        # Organize resources by service (subcategory)
        resources_by_service: Dict[str, List[str]] = {}
        for resource in resources:
            service = resource.subcategory
            if service not in resources_by_service:
                resources_by_service[service] = []
            resources_by_service[service].append(resource.resource_name)
        
        # Calculate statistics
        total_services = len(resources_by_service)
        total_resources = len(resources)
        statistics = Statistics(
            total_services=total_services,
            total_resources=total_resources
        )
        
        # Create and return metadata object
        return RunMetadata(
            provider=csp,
            version=version,
            generated_at=generated_at,
            resources=resources_by_service,
            statistics=statistics,
            dry_run=dry_run
        )
    
    def write_metadata_file(
        self,
        output_dir: Path,
        csp: str,
        metadata: RunMetadata
    ) -> Path:
        """
        Write a metadata file to the filesystem.
        
        Creates the metadata file at docs/{csp}/_history/{timestamp}.json
        with proper JSON formatting (indent=2). Creates the _history directory
        if it doesn't exist.
        
        Args:
            output_dir: Base output directory (typically 'docs/')
            csp: Cloud service provider identifier
            metadata: RunMetadata object to write
        
        Returns:
            Path: Full path to the written metadata file
        
        Raises:
            OSError: If directory creation or file writing fails
        
        Example:
            >>> manager = MetadataManager()
            >>> metadata = RunMetadata("aws", "5.0.0", "2024-11-28T10:30:00Z", 
            ...                        {"S3": ["aws_s3_bucket"]}, 
            ...                        Statistics(1, 1))
            >>> path = manager.write_metadata_file(Path("docs"), "aws", metadata)
            >>> print(path.exists())  # True
        """
        try:
            # Create _history directory if it doesn't exist
            history_dir = output_dir / csp / "_history"
            history_dir.mkdir(parents=True, exist_ok=True)
            
            # Generate filename and full path
            filename = metadata.get_filename()
            file_path = history_dir / filename
            
            # Write metadata as JSON
            with open(file_path, 'w') as f:
                json.dump(metadata.to_json_dict(), f, indent=2)
            
            return file_path
            
        except PermissionError as e:
            raise FilesystemError(
                "Permission denied writing metadata file",
                file_path=str(file_path),
                operation="write metadata"
            ) from e
            
        except OSError as e:
            raise FilesystemError(
                f"Failed to write metadata file: {str(e)}",
                file_path=str(file_path),
                operation="write metadata"
            ) from e
    
    def list_metadata_files(self, output_dir: Path, csp: str) -> List[Path]:
        """
        List all metadata files for a given CSP.
        
        Searches for files matching the pattern *.json in the
        _history directory and returns them sorted by timestamp (oldest first).
        
        Args:
            output_dir: Base output directory (typically 'docs/')
            csp: Cloud service provider identifier
        
        Returns:
            List[Path]: List of metadata file paths sorted by timestamp
        
        Example:
            >>> manager = MetadataManager()
            >>> files = manager.list_metadata_files(Path("docs"), "aws")
            >>> for file in files:
            ...     print(file.name)
            # 2024-11-27T10-00-00Z.json
            # 2024-11-28T10-30-00Z.json
        """
        history_dir = output_dir / csp / "_history"
        
        # Return empty list if directory doesn't exist
        if not history_dir.exists():
            return []
        
        # Find all JSON files in _history
        metadata_files = list(history_dir.glob("*.json"))
        
        # Sort by filename (ISO 8601 timestamps sort lexicographically)
        metadata_files.sort(key=lambda p: p.name)
        
        return metadata_files
    
    def get_latest_metadata(
        self,
        output_dir: Path,
        csp: str
    ) -> Optional[RunMetadata]:
        """
        Get the most recent metadata file for a CSP.
        
        Finds all metadata files, sorts them by timestamp, and returns the
        parsed metadata from the most recent file. Used for change detection
        to determine the previous provider version.
        
        Args:
            output_dir: Base output directory (typically 'docs/')
            csp: Cloud service provider identifier
        
        Returns:
            Optional[RunMetadata]: Most recent metadata, or None if no files exist
        
        Example:
            >>> manager = MetadataManager()
            >>> latest = manager.get_latest_metadata(Path("docs"), "aws")
            >>> if latest:
            ...     print(f"Previous version: {latest.version}")
            # Previous version: 5.0.0
        """
        # Get all metadata files sorted by timestamp
        metadata_files = self.list_metadata_files(output_dir, csp)
        
        # Return None if no files exist
        if not metadata_files:
            return None
        
        # Get the last file (most recent)
        latest_file = metadata_files[-1]
        
        # Parse and return the metadata
        try:
            with open(latest_file, 'r') as f:
                data = json.load(f)
            
            # Reconstruct Statistics object
            stats_data = data['statistics']
            statistics = Statistics(
                total_services=stats_data['total_services'],
                total_resources=stats_data['total_resources']
            )
            
            # Reconstruct RunMetadata object
            metadata = RunMetadata(
                provider=data['provider'],
                version=data['version'],
                generated_at=data['generated_at'],
                resources=data['resources'],
                statistics=statistics,
                dry_run=data.get('dry_run', False)  # Default to False for backward compatibility
            )
            
            return metadata
        
        except (json.JSONDecodeError, KeyError, OSError) as e:
            # If file is corrupted or missing fields, return None
            # In production, this might log a warning
            return None
