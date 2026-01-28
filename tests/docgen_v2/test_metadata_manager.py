"""
Tests for MetadataManager.

Contains both unit tests and property-based tests for the metadata manager
that handles generation run tracking and metadata file operations.

Property-Based Tests:
    - test_timestamped_metadata_file_is_created: Property 35
    - test_metadata_file_location_is_consistent: Property 36
    - test_metadata_content_is_complete: Property 37
    - test_metadata_resources_match_generated_files: Property 38
    - test_previous_metadata_files_are_preserved: Property 39
"""

import json
import sys
import tempfile
import time
from pathlib import Path
import pytest
from hypothesis import given, strategies as st, settings, assume
from datetime import datetime

# Add project root to path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v2.lib.models import Argument, Resource, RunMetadata, Statistics
from scripts.docgen_v2.lib.metadata_manager import MetadataManager


# Hypothesis strategies for generating test data

@st.composite
def csp_strategy(draw):
    """Generate valid CSP identifiers."""
    return draw(st.sampled_from(['aws', 'azure', 'gcp']))


@st.composite
def version_strategy(draw):
    """Generate valid version strings."""
    major = draw(st.integers(min_value=1, max_value=10))
    minor = draw(st.integers(min_value=0, max_value=99))
    patch = draw(st.integers(min_value=0, max_value=99))
    return f"{major}.{minor}.{patch}"


@st.composite
def service_name_strategy(draw):
    """Generate valid service names."""
    return draw(st.text(
        alphabet=st.characters(
            whitelist_categories=('Ll', 'Lu', 'Nd'),
            whitelist_characters='_- ()'
        ),
        min_size=1,
        max_size=50
    ))


@st.composite
def resource_name_strategy(draw, csp: str):
    """Generate valid resource names for a given CSP."""
    csp_prefixes = {
        'aws': 'aws',
        'azure': st.sampled_from(['azurerm', 'azuread', 'azapi']),
        'gcp': st.sampled_from(['google', 'google-beta'])
    }
    
    if csp == 'aws':
        prefix = 'aws'
    elif csp == 'azure':
        prefix = draw(csp_prefixes['azure'])
    else:  # gcp
        prefix = draw(csp_prefixes['gcp'])
    
    service_part = draw(st.text(
        alphabet=st.characters(whitelist_categories=('Ll',), whitelist_characters='_'),
        min_size=1,
        max_size=20
    ))
    resource_part = draw(st.text(
        alphabet=st.characters(whitelist_categories=('Ll',), whitelist_characters='_'),
        min_size=1,
        max_size=20
    ))
    
    return f"{prefix}_{service_part}_{resource_part}"


@st.composite
def simple_resource_strategy(draw, csp: str):
    """Generate simple Resource objects for testing."""
    resource_name = draw(resource_name_strategy(csp))
    subcategory = draw(service_name_strategy())
    
    # Generate 0-3 simple arguments
    num_args = draw(st.integers(min_value=0, max_value=3))
    arguments = {}
    for i in range(num_args):
        arg_name = draw(st.text(
            alphabet=st.characters(whitelist_categories=('Ll',), whitelist_characters='_'),
            min_size=1,
            max_size=20
        ))
        arg = Argument(
            description=draw(st.text(min_size=1, max_size=50)),
            required=draw(st.one_of(st.booleans(), st.none())),
            deprecated=draw(st.booleans())
        )
        arguments[arg_name] = arg
    
    return Resource(
        resource_name=resource_name,
        subcategory=subcategory,
        arguments=arguments,
        provider=csp,
        version=None
    )


@st.composite
def resource_list_strategy(draw, csp: str):
    """Generate a list of resources for a given CSP."""
    num_resources = draw(st.integers(min_value=1, max_value=10))
    resources = []
    for _ in range(num_resources):
        resource = draw(simple_resource_strategy(csp))
        resources.append(resource)
    return resources


# Property-Based Tests

@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    version=version_strategy(),
    resources=st.data()
)
def test_timestamped_metadata_file_is_created(csp: str, version: str, resources):
    """
    Feature: terraform-json-generator, Property 35: Timestamped metadata file is created
    
    Validates: Requirements 10.1
    
    Property: For any completed processing run, a timestamped metadata file should
    be created with filename format {timestamp}.json
    
    This test verifies that:
    1. A metadata file is created after processing
    2. The filename follows the pattern {timestamp}.json
    3. The timestamp is in ISO 8601 format (with colons replaced by hyphens)
    4. The file actually exists on the filesystem
    
    Args:
        csp: A randomly generated CSP identifier
        version: A randomly generated version string
        resources: Strategy data for generating resources
    """
    # Generate resources for this CSP
    resource_list = resources.draw(resource_list_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create metadata
        metadata = manager.create_run_metadata(csp, version, resource_list)
        
        # Write metadata file
        file_path = manager.write_metadata_file(output_dir, csp, metadata)
        
        # Verify file exists
        assert file_path.exists(), f"Metadata file should exist: {file_path}"
        assert file_path.is_file(), f"Path should be a file: {file_path}"
        
        # Verify filename follows pattern
        filename = file_path.name
        assert filename.endswith(".json"), \
            f"Filename should end with '.json': {filename}"
        
        # Extract timestamp from filename
        timestamp_part = filename[:-len(".json")]
        
        # Verify timestamp format (ISO 8601 with colons replaced by hyphens)
        # Format should be: YYYY-MM-DDTHH-MM-SS.microseconds Z
        import re
        timestamp_pattern = r'^\d{4}-\d{2}-\d{2}T\d{2}-\d{2}-\d{2}\.\d+Z$'
        assert re.match(timestamp_pattern, timestamp_part), \
            f"Timestamp should match ISO 8601 format: {timestamp_part}"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    version=version_strategy(),
    resources=st.data()
)
def test_metadata_file_location_is_consistent(csp: str, version: str, resources):
    """
    Feature: terraform-json-generator, Property 36: Metadata file location is consistent
    
    Validates: Requirements 10.2
    
    Property: For any processing run, the metadata file should be created at
    docs/{csp}/_history/{timestamp}.json
    
    This test verifies that:
    1. The metadata file is in the correct CSP/_history directory
    2. The path follows the pattern docs/{csp}/_history/{timestamp}.json
    3. The file is in the _history subdirectory
    
    Args:
        csp: A randomly generated CSP identifier
        version: A randomly generated version string
        resources: Strategy data for generating resources
    """
    # Generate resources for this CSP
    resource_list = resources.draw(resource_list_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create and write metadata
        metadata = manager.create_run_metadata(csp, version, resource_list)
        file_path = manager.write_metadata_file(output_dir, csp, metadata)
        
        # Verify path structure
        relative_path = file_path.relative_to(output_dir)
        parts = relative_path.parts
        
        # Should be: csp / _history / {timestamp}.json
        assert len(parts) == 3, \
            f"Path should have 3 components (csp/_history/filename): {parts}"
        assert parts[0] == csp, \
            f"First component should be CSP: expected {csp}, got {parts[0]}"
        assert parts[1] == "_history", \
            f"Second component should be '_history': got {parts[1]}"
        assert parts[2].endswith(".json"), \
            f"Third component should be JSON file: {parts[2]}"
        
        # Verify file is in _history subdirectory
        assert file_path.parent == output_dir / csp / "_history", \
            f"File should be in _history subdirectory: {file_path.parent}"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    version=version_strategy(),
    resources=st.data()
)
def test_metadata_content_is_complete(csp: str, version: str, resources):
    """
    Feature: terraform-json-generator, Property 37: Metadata content is complete
    
    Validates: Requirements 10.4, 10.5, 10.6
    
    Property: For any metadata file, it should include provider name, version,
    generated_at timestamp, resources object, and statistics object.
    
    This test verifies that:
    1. All required top-level fields are present
    2. The resources object maps services to resource lists
    3. The statistics object contains total_services and total_resources
    4. All values are of the correct type
    
    Args:
        csp: A randomly generated CSP identifier
        version: A randomly generated version string
        resources: Strategy data for generating resources
    """
    # Generate resources for this CSP
    resource_list = resources.draw(resource_list_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create and write metadata
        metadata = manager.create_run_metadata(csp, version, resource_list)
        file_path = manager.write_metadata_file(output_dir, csp, metadata)
        
        # Read and parse the JSON file
        with open(file_path, 'r') as f:
            data = json.load(f)
        
        # Verify all required fields are present
        required_fields = ['provider', 'version', 'generated_at', 'resources', 'statistics']
        for field in required_fields:
            assert field in data, f"Metadata should contain '{field}' field"
        
        # Verify field values
        assert data['provider'] == csp, \
            f"Provider should be {csp}, got {data['provider']}"
        assert data['version'] == version, \
            f"Version should be {version}, got {data['version']}"
        
        # Verify generated_at is a valid ISO 8601 timestamp
        assert isinstance(data['generated_at'], str), \
            "generated_at should be a string"
        assert data['generated_at'].endswith('Z'), \
            "generated_at should end with 'Z' (UTC)"
        
        # Verify resources is a dictionary
        assert isinstance(data['resources'], dict), \
            "resources should be a dictionary"
        
        # Verify each service maps to a list of resource names
        for service, resource_names in data['resources'].items():
            assert isinstance(service, str), \
                f"Service name should be a string: {service}"
            assert isinstance(resource_names, list), \
                f"Resource names should be a list for service {service}"
            for resource_name in resource_names:
                assert isinstance(resource_name, str), \
                    f"Resource name should be a string: {resource_name}"
        
        # Verify statistics object
        assert isinstance(data['statistics'], dict), \
            "statistics should be a dictionary"
        assert 'total_services' in data['statistics'], \
            "statistics should contain 'total_services'"
        assert 'total_resources' in data['statistics'], \
            "statistics should contain 'total_resources'"
        
        # Verify statistics values are integers
        assert isinstance(data['statistics']['total_services'], int), \
            "total_services should be an integer"
        assert isinstance(data['statistics']['total_resources'], int), \
            "total_resources should be an integer"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    version=version_strategy(),
    resources=st.data()
)
def test_metadata_resources_match_generated_files(csp: str, version: str, resources):
    """
    Feature: terraform-json-generator, Property 38: Metadata resources match generated files
    
    Validates: Requirements 10.5
    
    Property: For any metadata file, the list of resources in the resources object
    should exactly match the set of generated resource JSON files in that run.
    
    This test verifies that:
    1. Every resource in the metadata was actually generated
    2. The count of resources matches the statistics
    3. Resources are correctly grouped by service
    
    Args:
        csp: A randomly generated CSP identifier
        version: A randomly generated version string
        resources: Strategy data for generating resources
    """
    # Generate resources for this CSP
    resource_list = resources.draw(resource_list_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create metadata
        metadata = manager.create_run_metadata(csp, version, resource_list)
        
        # Verify resources in metadata match input resources
        all_metadata_resources = []
        for service, resource_names in metadata.resources.items():
            all_metadata_resources.extend(resource_names)
        
        # Get all resource names from input
        all_input_resources = [r.resource_name for r in resource_list]
        
        # Verify counts match
        assert len(all_metadata_resources) == len(all_input_resources), \
            f"Metadata should contain all resources: expected {len(all_input_resources)}, got {len(all_metadata_resources)}"
        
        # Verify all input resources are in metadata
        for resource_name in all_input_resources:
            assert resource_name in all_metadata_resources, \
                f"Resource {resource_name} should be in metadata"
        
        # Verify statistics match
        assert metadata.statistics.total_resources == len(resource_list), \
            f"total_resources should be {len(resource_list)}, got {metadata.statistics.total_resources}"
        
        # Verify service grouping is correct
        services_in_input = set(r.subcategory for r in resource_list)
        services_in_metadata = set(metadata.resources.keys())
        
        assert services_in_metadata == services_in_input, \
            f"Services in metadata should match input: expected {services_in_input}, got {services_in_metadata}"
        
        # Verify each service has the correct resources
        for resource in resource_list:
            service = resource.subcategory
            assert resource.resource_name in metadata.resources[service], \
                f"Resource {resource.resource_name} should be in service {service}"


@settings(max_examples=10, deadline=None)
@given(
    csp=csp_strategy(),
    version1=version_strategy(),
    version2=version_strategy(),
    resources1=st.data(),
    resources2=st.data()
)
def test_previous_metadata_files_are_preserved(
    csp: str,
    version1: str,
    version2: str,
    resources1,
    resources2
):
    """
    Feature: terraform-json-generator, Property 39: Previous metadata files are preserved
    
    Validates: Requirements 10.7
    
    Property: For any new metadata file creation, all existing metadata files
    should remain unchanged.
    
    This test verifies that:
    1. Creating a new metadata file doesn't delete old ones
    2. Old metadata files remain readable and unchanged
    3. Multiple metadata files can coexist
    4. The latest metadata can be retrieved correctly
    
    Args:
        csp: A randomly generated CSP identifier
        version1: First version string
        version2: Second version string
        resources1: Strategy data for first resource list
        resources2: Strategy data for second resource list
    """
    # Ensure versions are different
    assume(version1 != version2)
    
    # Generate resources for this CSP
    resource_list1 = resources1.draw(resource_list_strategy(csp))
    resource_list2 = resources2.draw(resource_list_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create and write first metadata file
        metadata1 = manager.create_run_metadata(csp, version1, resource_list1)
        file_path1 = manager.write_metadata_file(output_dir, csp, metadata1)
        
        # Read first file content
        with open(file_path1, 'r') as f:
            content1_original = f.read()
        
        # Wait at least 1 second to ensure different timestamps (no microseconds in filenames)
        time.sleep(1.1)
        
        # Create and write second metadata file
        metadata2 = manager.create_run_metadata(csp, version2, resource_list2)
        file_path2 = manager.write_metadata_file(output_dir, csp, metadata2)
        
        # Verify both files exist
        assert file_path1.exists(), f"First metadata file should still exist: {file_path1}"
        assert file_path2.exists(), f"Second metadata file should exist: {file_path2}"
        
        # Verify files are different
        assert file_path1 != file_path2, \
            "Metadata files should have different paths (different timestamps)"
        
        # Verify first file content is unchanged
        with open(file_path1, 'r') as f:
            content1_after = f.read()
        
        assert content1_original == content1_after, \
            "First metadata file content should be unchanged"
        
        # Verify we can list both files
        all_files = manager.list_metadata_files(output_dir, csp)
        assert len(all_files) >= 2, \
            f"Should have at least 2 metadata files, got {len(all_files)}"
        
        # Verify both files are in the list
        file_paths = set(all_files)
        assert file_path1 in file_paths, \
            "First metadata file should be in the list"
        assert file_path2 in file_paths, \
            "Second metadata file should be in the list"
        
        # Verify get_latest_metadata returns the most recent one
        latest = manager.get_latest_metadata(output_dir, csp)
        assert latest is not None, "Should be able to retrieve latest metadata"
        assert latest.version == version2, \
            f"Latest metadata should have version {version2}, got {latest.version}"


# Unit Tests

def test_create_run_metadata_basic():
    """Test basic metadata creation."""
    manager = MetadataManager()
    
    resources = [
        Resource("aws_s3_bucket", "S3", {}, "aws", "5.0.0"),
        Resource("aws_s3_object", "S3", {}, "aws", "5.0.0"),
        Resource("aws_ec2_instance", "EC2", {}, "aws", "5.0.0")
    ]
    
    metadata = manager.create_run_metadata("aws", "5.0.0", resources)
    
    assert metadata.provider == "aws"
    assert metadata.version == "5.0.0"
    assert metadata.generated_at.endswith('Z')
    assert len(metadata.resources) == 2  # 2 services
    assert metadata.statistics.total_services == 2
    assert metadata.statistics.total_resources == 3


def test_create_run_metadata_groups_by_service():
    """Test that resources are correctly grouped by service."""
    manager = MetadataManager()
    
    resources = [
        Resource("aws_s3_bucket", "S3", {}, "aws", "5.0.0"),
        Resource("aws_s3_object", "S3", {}, "aws", "5.0.0"),
        Resource("aws_ec2_instance", "EC2", {}, "aws", "5.0.0")
    ]
    
    metadata = manager.create_run_metadata("aws", "5.0.0", resources)
    
    assert "S3" in metadata.resources
    assert "EC2" in metadata.resources
    assert len(metadata.resources["S3"]) == 2
    assert len(metadata.resources["EC2"]) == 1
    assert "aws_s3_bucket" in metadata.resources["S3"]
    assert "aws_s3_object" in metadata.resources["S3"]
    assert "aws_ec2_instance" in metadata.resources["EC2"]


def test_write_metadata_file_basic():
    """Test basic metadata file writing."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        metadata = RunMetadata(
            provider="aws",
            version="5.0.0",
            generated_at="2024-11-28T10:30:00Z",
            resources={"S3": ["aws_s3_bucket"]},
            statistics=Statistics(total_services=1, total_resources=1)
        )
        
        file_path = manager.write_metadata_file(output_dir, "aws", metadata)
        
        assert file_path.exists()
        assert file_path.parent == output_dir / "aws" / "_history"
        
        # Verify JSON content
        with open(file_path, 'r') as f:
            data = json.load(f)
        
        assert data['provider'] == "aws"
        assert data['version'] == "5.0.0"


def test_list_metadata_files_empty():
    """Test listing metadata files when none exist."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        files = manager.list_metadata_files(output_dir, "aws")
        
        assert files == []


def test_list_metadata_files_sorted():
    """Test that metadata files are sorted by timestamp."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create multiple metadata files with different timestamps
        timestamps = [
            "2024-11-28T10:00:00Z",
            "2024-11-28T12:00:00Z",
            "2024-11-28T11:00:00Z"
        ]
        
        for ts in timestamps:
            metadata = RunMetadata(
                provider="aws",
                version="5.0.0",
                generated_at=ts,
                resources={},
                statistics=Statistics(0, 0)
            )
            manager.write_metadata_file(output_dir, "aws", metadata)
        
        files = manager.list_metadata_files(output_dir, "aws")
        
        assert len(files) == 3
        
        # Verify files are sorted by timestamp
        filenames = [f.name for f in files]
        assert filenames[0] == "2024-11-28T10-00-00Z.json"
        assert filenames[1] == "2024-11-28T11-00-00Z.json"
        assert filenames[2] == "2024-11-28T12-00-00Z.json"


def test_get_latest_metadata_none():
    """Test getting latest metadata when none exist."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        latest = manager.get_latest_metadata(output_dir, "aws")
        
        assert latest is None


def test_get_latest_metadata_returns_most_recent():
    """Test that get_latest_metadata returns the most recent file."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = MetadataManager()
        
        # Create multiple metadata files
        metadata1 = RunMetadata(
            provider="aws",
            version="5.0.0",
            generated_at="2024-11-28T10:00:00Z",
            resources={"S3": ["aws_s3_bucket"]},
            statistics=Statistics(1, 1)
        )
        manager.write_metadata_file(output_dir, "aws", metadata1)
        
        metadata2 = RunMetadata(
            provider="aws",
            version="5.1.0",
            generated_at="2024-11-28T12:00:00Z",
            resources={"S3": ["aws_s3_bucket", "aws_s3_object"]},
            statistics=Statistics(1, 2)
        )
        manager.write_metadata_file(output_dir, "aws", metadata2)
        
        # Get latest
        latest = manager.get_latest_metadata(output_dir, "aws")
        
        assert latest is not None
        assert latest.version == "5.1.0"
        assert latest.statistics.total_resources == 2


def test_metadata_filename_generation():
    """Test that metadata filename is generated correctly."""
    metadata = RunMetadata(
        provider="aws",
        version="5.0.0",
        generated_at="2024-11-28T10:30:00Z",
        resources={},
        statistics=Statistics(0, 0)
    )
    
    filename = metadata.get_filename()
    
    assert filename == "2024-11-28T10-30-00Z.json"


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
