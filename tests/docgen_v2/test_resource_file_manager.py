"""
Tests for ResourceFileManager.

Contains both unit tests and property-based tests for the resource file manager
that handles JSON file operations and directory structures.

Property-Based Tests:
    - test_directory_structure_follows_naming_pattern: Property 1
    - test_directory_creation_is_idempotent: Property 2
    - test_multiple_services_create_distinct_directories: Property 3
    - test_file_naming_follows_convention: Property 9
"""

import json
import sys
import tempfile
import shutil
from pathlib import Path
import pytest
from hypothesis import given, strategies as st, settings, assume
from typing import Dict

# Add project root to path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v2.lib.models import Argument, Resource
from scripts.docgen_v2.lib.resource_file_manager import (
    ResourceFileManager,
    sanitize_subcategory_for_path,
    get_resource_filename
)


# Hypothesis strategies for generating test data

@st.composite
def csp_strategy(draw):
    """Generate valid CSP identifiers."""
    return draw(st.sampled_from(['aws', 'azure', 'gcp']))


@st.composite
def service_name_strategy(draw):
    """Generate valid service names."""
    # Service names should be filesystem-safe
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
    # Resource names follow pattern: {csp_prefix}_{service}_{resource}
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
    
    # Generate service and resource parts
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
def simple_argument_strategy(draw):
    """Generate simple Argument objects without nesting."""
    description = draw(st.text(min_size=1, max_size=100))
    required = draw(st.one_of(st.booleans(), st.none()))
    deprecated = draw(st.booleans())
    
    return Argument(
        description=description,
        required=required,
        parent=None,
        deprecated=deprecated
    )


@st.composite
def simple_resource_strategy(draw, csp: str):
    """Generate simple Resource objects for testing."""
    resource_name = draw(resource_name_strategy(csp))
    subcategory = draw(service_name_strategy())
    
    # Generate 1-5 simple arguments
    num_args = draw(st.integers(min_value=1, max_value=5))
    arguments = {}
    for i in range(num_args):
        arg_name = draw(st.text(
            alphabet=st.characters(whitelist_categories=('Ll',), whitelist_characters='_'),
            min_size=1,
            max_size=20
        ))
        arg = draw(simple_argument_strategy())
        arguments[arg_name] = arg
    
    return Resource(
        resource_name=resource_name,
        subcategory=subcategory,
        arguments=arguments,
        provider=csp,
        version=None
    )


# Property-Based Tests

@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    service=service_name_strategy()
)
def test_directory_structure_follows_naming_pattern(csp: str, service: str):
    """
    Feature: terraform-json-generator, Property 1: Directory structure follows naming pattern
    
    Validates: Requirements 1.1
    
    Property: For any valid CSP and service name, creating the directory structure
    should result in a path matching the pattern docs/{csp}/{service}/resource_json/
    
    This test verifies that:
    1. The directory path follows the exact pattern specified
    2. All path components are present in the correct order
    3. The pattern is consistent across all CSP and service combinations
    
    Args:
        csp: A randomly generated CSP identifier
        service: A randomly generated service name
    """
    # Filter out service names that would cause filesystem issues
    assume(service.strip() != '')
    assume(not service.startswith('.'))
    assume(not service.endswith('.'))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        # Create directory structure
        result_path = manager.create_directory_structure(csp, service, output_dir)
        
        # Verify the path follows the pattern (with sanitized service name)
        sanitized_service = sanitize_subcategory_for_path(service)
        expected_path = output_dir / csp / sanitized_service / "resource_json"
        assert result_path == expected_path, \
            f"Path should match pattern: expected {expected_path}, got {result_path}"
        
        # Verify all components are present
        parts = result_path.relative_to(output_dir).parts
        assert len(parts) == 3, f"Path should have 3 components: {parts}"
        assert parts[0] == csp, f"First component should be CSP: {parts[0]}"
        assert parts[1] == sanitized_service, f"Second component should be sanitized service: {parts[1]}"
        assert parts[2] == "resource_json", f"Third component should be 'resource_json': {parts[2]}"
        
        # Verify directory actually exists
        assert result_path.exists(), f"Directory should exist: {result_path}"
        assert result_path.is_dir(), f"Path should be a directory: {result_path}"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    service=service_name_strategy(),
    num_calls=st.integers(min_value=2, max_value=5)
)
def test_directory_creation_is_idempotent(csp: str, service: str, num_calls: int):
    """
    Feature: terraform-json-generator, Property 2: Directory creation is idempotent
    
    Validates: Requirements 1.2
    
    Property: For any directory path, creating it multiple times should succeed
    without error and result in the same directory existing.
    
    This test verifies that:
    1. Multiple calls to create_directory_structure don't raise errors
    2. The same path is returned each time
    3. The directory exists after all calls
    4. No duplicate directories are created
    
    Args:
        csp: A randomly generated CSP identifier
        service: A randomly generated service name
        num_calls: Number of times to call create_directory_structure (2-5)
    """
    # Filter out service names that would cause filesystem issues
    assume(service.strip() != '')
    assume(not service.startswith('.'))
    assume(not service.endswith('.'))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        # Call create_directory_structure multiple times
        paths = []
        for i in range(num_calls):
            try:
                result_path = manager.create_directory_structure(csp, service, output_dir)
                paths.append(result_path)
            except Exception as e:
                pytest.fail(f"Call {i+1} raised exception: {e}")
        
        # Verify all calls returned the same path
        assert len(set(paths)) == 1, \
            f"All calls should return the same path, got: {set(paths)}"
        
        # Verify directory exists
        final_path = paths[0]
        assert final_path.exists(), f"Directory should exist: {final_path}"
        assert final_path.is_dir(), f"Path should be a directory: {final_path}"
        
        # Verify no duplicate directories were created (with sanitized service name)
        sanitized_service = sanitize_subcategory_for_path(service)
        expected_path = output_dir / csp / sanitized_service / "resource_json"
        assert final_path == expected_path, \
            f"Final path should match expected: {expected_path}"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    services=st.lists(
        service_name_strategy(),
        min_size=2,
        max_size=5,
        unique=True
    )
)
def test_multiple_services_create_distinct_directories(csp: str, services: list):
    """
    Feature: terraform-json-generator, Property 3: Multiple services create distinct directories
    
    Validates: Requirements 1.3
    
    Property: For any CSP and list of service names, processing all services should
    create a separate directory for each service under the same CSP directory.
    
    This test verifies that:
    1. Each service gets its own directory
    2. All directories are under the same CSP directory
    3. Directories are distinct (no collisions)
    4. All directories follow the correct pattern
    
    Args:
        csp: A randomly generated CSP identifier
        services: A list of unique service names (2-5 services)
    """
    # Filter out service names that would cause filesystem issues
    services = [s for s in services if s.strip() != '' and not s.startswith('.') and not s.endswith('.')]
    assume(len(services) >= 2)
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        # Create directories for all services
        created_paths = []
        for service in services:
            result_path = manager.create_directory_structure(csp, service, output_dir)
            created_paths.append(result_path)
        
        # Verify all paths are distinct
        assert len(set(created_paths)) == len(services), \
            f"Should create {len(services)} distinct directories, got {len(set(created_paths))}"
        
        # Verify all directories exist
        for path in created_paths:
            assert path.exists(), f"Directory should exist: {path}"
            assert path.is_dir(), f"Path should be a directory: {path}"
        
        # Verify all directories are under the same CSP directory
        csp_dir = output_dir / csp
        for path in created_paths:
            assert path.parent.parent == csp_dir, \
                f"Directory should be under CSP directory {csp_dir}: {path}"
        
        # Verify each service has its own directory (with sanitized names)
        for i, service in enumerate(services):
            sanitized_service = sanitize_subcategory_for_path(service)
            expected_path = output_dir / csp / sanitized_service / "resource_json"
            assert created_paths[i] == expected_path, \
                f"Service {service} should have path {expected_path}, got {created_paths[i]}"


@settings(max_examples=100)
@given(
    csp=csp_strategy(),
    resource=st.data()
)
def test_file_naming_follows_convention(csp: str, resource):
    """
    Feature: terraform-json-generator, Property 9: File naming follows convention
    
    Validates: Requirements 3.1
    
    Property: For any resource with name R, the generated file should be named
    {R}.template.json and located in the resource_json subdirectory.
    
    This test verifies that:
    1. File name matches the pattern {resource_name}.template.json
    2. File is located in the correct resource_json directory
    3. File path follows the complete pattern
    4. File actually exists after writing
    
    Args:
        csp: A randomly generated CSP identifier
        resource: Strategy data for generating a resource
    """
    # Generate a resource for this CSP
    resource_obj = resource.draw(simple_resource_strategy(csp))
    
    # Create temporary directory for testing
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        # Write resource JSON
        file_path = manager.write_resource_json(resource_obj, output_dir)
        
        # Verify file name follows convention (without CSP prefix)
        expected_filename = get_resource_filename(resource_obj.resource_name)
        assert file_path.name == expected_filename, \
            f"File name should be {expected_filename}, got {file_path.name}"
        
        # Verify file is in resource_json directory
        assert file_path.parent.name == "resource_json", \
            f"File should be in resource_json directory, got {file_path.parent.name}"
        
        # Verify complete path structure
        # Path should be: output_dir / csp / sanitized_service / resource_json / {resource_name_without_prefix}.template.json
        relative_path = file_path.relative_to(output_dir)
        parts = relative_path.parts
        
        sanitized_subcategory = sanitize_subcategory_for_path(resource_obj.subcategory)
        
        assert len(parts) == 4, f"Path should have 4 components: {parts}"
        assert parts[0] == csp, f"First component should be CSP: {parts[0]}"
        assert parts[1] == sanitized_subcategory, f"Second component should be sanitized service: {parts[1]}"
        assert parts[2] == "resource_json", f"Third component should be 'resource_json': {parts[2]}"
        assert parts[3] == expected_filename, f"Fourth component should be filename: {parts[3]}"
        
        # Verify file exists
        assert file_path.exists(), f"File should exist: {file_path}"
        assert file_path.is_file(), f"Path should be a file: {file_path}"
        
        # Verify file contains valid JSON
        with open(file_path, 'r') as f:
            json_data = json.load(f)
        
        assert 'resource_name' in json_data, "JSON should contain resource_name"
        assert json_data['resource_name'] == resource_obj.resource_name, \
            f"JSON resource_name should match: {resource_obj.resource_name}"


# Unit Tests

def test_create_directory_structure_basic():
    """Test basic directory structure creation."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        result = manager.create_directory_structure("aws", "S3 (Simple Storage)", output_dir)
        
        # Service name should be sanitized (spaces replaced with underscores)
        expected = output_dir / "aws" / "S3_(Simple_Storage)" / "resource_json"
        assert result == expected
        assert result.exists()
        assert result.is_dir()


def test_write_resource_json_basic():
    """Test basic resource JSON writing."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        resource = Resource(
            resource_name="aws_s3_bucket",
            subcategory="S3",
            arguments={
                "bucket": Argument(description="Bucket name", required=False)
            }
        )
        
        file_path = manager.write_resource_json(resource, output_dir)
        
        assert file_path.exists()
        # Filename should not have CSP prefix
        assert file_path.name == "s3_bucket.template.json"
        
        # Verify JSON content
        with open(file_path, 'r') as f:
            data = json.load(f)
        
        assert data['resource_name'] == "aws_s3_bucket"
        assert data['subcategory'] == "S3"
        assert 'bucket' in data['arguments']


def test_read_existing_json_basic():
    """Test reading existing JSON file."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        # Write a resource
        original_resource = Resource(
            resource_name="aws_s3_bucket",
            subcategory="S3",
            arguments={
                "bucket": Argument(description="Bucket name", required=False, deprecated=True)
            }
        )
        
        file_path = manager.write_resource_json(original_resource, output_dir)
        
        # Read it back
        read_resource = manager.read_existing_json(file_path)
        
        assert read_resource is not None
        assert read_resource.resource_name == original_resource.resource_name
        assert read_resource.subcategory == original_resource.subcategory
        assert 'bucket' in read_resource.arguments
        assert read_resource.arguments['bucket'].description == "Bucket name"
        assert read_resource.arguments['bucket'].required is False
        assert read_resource.arguments['bucket'].deprecated is True


def test_read_existing_json_nonexistent_file():
    """Test reading non-existent file returns None."""
    manager = ResourceFileManager()
    result = manager.read_existing_json(Path("/nonexistent/file.json"))
    assert result is None


def test_write_resource_json_with_nested_arguments():
    """Test writing resource with nested arguments."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        nested_arg = Argument(
            description="Nested arg",
            required=True,
            parent="parent_arg"
        )
        
        parent_arg = Argument(
            description="Parent arg",
            required=False,
            arguments={"nested": nested_arg}
        )
        
        resource = Resource(
            resource_name="aws_test_resource",
            subcategory="Test",
            arguments={"parent_arg": parent_arg}
        )
        
        file_path = manager.write_resource_json(resource, output_dir)
        
        # Read back and verify nesting
        read_resource = manager.read_existing_json(file_path)
        
        assert read_resource is not None
        assert 'parent_arg' in read_resource.arguments
        assert read_resource.arguments['parent_arg'].arguments is not None
        assert 'nested' in read_resource.arguments['parent_arg'].arguments
        assert read_resource.arguments['parent_arg'].arguments['nested'].parent == "parent_arg"


def test_extract_csp_from_resource_name():
    """Test CSP extraction from resource names."""
    manager = ResourceFileManager()
    
    assert manager._extract_csp_from_resource_name("aws_s3_bucket") == "aws"
    assert manager._extract_csp_from_resource_name("azurerm_storage_account") == "azure"
    assert manager._extract_csp_from_resource_name("google_storage_bucket") == "gcp"
    assert manager._extract_csp_from_resource_name("google-beta_compute_instance") == "gcp"


def test_write_resource_json_creates_directory():
    """Test that write_resource_json creates directory if it doesn't exist."""
    with tempfile.TemporaryDirectory() as temp_dir:
        output_dir = Path(temp_dir)
        manager = ResourceFileManager()
        
        resource = Resource(
            resource_name="aws_s3_bucket",
            subcategory="S3 (Simple Storage)",
            arguments={}
        )
        
        # Directory doesn't exist yet (with sanitized subcategory)
        expected_dir = output_dir / "aws" / "S3_(Simple_Storage)" / "resource_json"
        assert not expected_dir.exists()
        
        # Write should create it
        file_path = manager.write_resource_json(resource, output_dir)
        
        assert expected_dir.exists()
        assert file_path.exists()


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
