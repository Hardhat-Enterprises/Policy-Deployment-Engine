"""
Tests for data models (Resource and Argument).

Contains both unit tests and property-based tests for the core data models
used throughout the generator.

Property-Based Tests:
    - test_json_round_trip_consistency: Verifies JSON serialization round-trip
"""

import json
import sys
from pathlib import Path
import pytest
from hypothesis import given, strategies as st, settings
from typing import Dict, Optional

# Add project root to path
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v2.lib.models import Argument, Resource


# Hypothesis strategies for generating test data

@st.composite
def argument_strategy(draw, max_depth: int = 3, current_depth: int = 0):
    """
    Generate random Argument objects with optional nested arguments.
    
    Args:
        draw: Hypothesis draw function
        max_depth: Maximum nesting depth for nested arguments
        current_depth: Current depth in the nesting hierarchy
    
    Returns:
        Argument: A randomly generated Argument object
    """
    description = draw(st.text(min_size=1, max_size=200))
    required = draw(st.one_of(st.booleans(), st.none()))
    parent = draw(st.one_of(st.text(min_size=1, max_size=50), st.none()))
    deprecated = draw(st.booleans())
    
    # Security fields are always None in current implementation
    security_impact = None
    rationale = None
    compliant = None
    non_compliant = None
    
    # Generate nested arguments only if we haven't reached max depth
    nested_args = None
    if current_depth < max_depth:
        # Randomly decide whether to have nested arguments
        has_nested = draw(st.booleans())
        if has_nested:
            # Generate 0-5 nested arguments
            num_nested = draw(st.integers(min_value=0, max_value=5))
            if num_nested > 0:
                nested_args = {}
                for i in range(num_nested):
                    arg_name = draw(st.text(
                        alphabet=st.characters(whitelist_categories=('Ll', 'Lu', 'Nd'), whitelist_characters='_'),
                        min_size=1,
                        max_size=30
                    ))
                    # Recursively generate nested argument with increased depth
                    nested_arg = draw(argument_strategy(max_depth=max_depth, current_depth=current_depth + 1))
                    nested_args[arg_name] = nested_arg
    
    return Argument(
        description=description,
        required=required,
        parent=parent,
        deprecated=deprecated,
        security_impact=security_impact,
        rationale=rationale,
        compliant=compliant,
        non_compliant=non_compliant,
        arguments=nested_args
    )


@st.composite
def resource_strategy(draw):
    """
    Generate random Resource objects with arguments.
    
    Args:
        draw: Hypothesis draw function
    
    Returns:
        Resource: A randomly generated Resource object
    """
    resource_name = draw(st.text(
        alphabet=st.characters(whitelist_categories=('Ll', 'Lu', 'Nd'), whitelist_characters='_'),
        min_size=1,
        max_size=50
    ))
    subcategory = draw(st.text(min_size=1, max_size=100))
    provider = draw(st.one_of(st.sampled_from(['aws', 'azure', 'gcp']), st.none()))
    version = draw(st.one_of(st.text(min_size=1, max_size=20), st.none()))
    
    # Generate 0-10 top-level arguments
    num_args = draw(st.integers(min_value=0, max_value=10))
    arguments = {}
    for i in range(num_args):
        arg_name = draw(st.text(
            alphabet=st.characters(whitelist_categories=('Ll', 'Lu', 'Nd'), whitelist_characters='_'),
            min_size=1,
            max_size=30
        ))
        arg = draw(argument_strategy(max_depth=2))
        arguments[arg_name] = arg
    
    return Resource(
        resource_name=resource_name,
        subcategory=subcategory,
        arguments=arguments,
        provider=provider,
        version=version
    )


# Property-Based Tests

@settings(max_examples=100)
@given(resource=resource_strategy())
def test_json_round_trip_consistency(resource: Resource):
    """
    Feature: terraform-json-generator, Property 14: JSON output round-trip consistency
    
    Validates: Requirements 4.5
    
    Property: For any generated JSON file, parsing it with a standard JSON parser
    and serializing it again should produce equivalent data.
    
    This test verifies that:
    1. Resource objects can be serialized to JSON
    2. The JSON is valid and can be parsed
    3. Re-serializing produces the same structure
    4. Metadata fields (provider, version) are not included in JSON output
    
    Args:
        resource: A randomly generated Resource object
    """
    # Step 1: Serialize resource to JSON dictionary
    json_dict = resource.to_json_dict()
    
    # Step 2: Verify _metadata block is present
    assert '_metadata' in json_dict, "_metadata block should be in JSON output"
    assert 'provider' in json_dict['_metadata'], "provider should be in _metadata"
    assert 'version' in json_dict['_metadata'], "version should be in _metadata"
    assert 'generated_at' in json_dict['_metadata'], "generated_at should be in _metadata"
    
    # Step 2b: Verify metadata values match resource
    assert json_dict['_metadata']['provider'] == resource.provider
    assert json_dict['_metadata']['version'] == resource.version
    
    # Step 3: Serialize to JSON string
    json_string = json.dumps(json_dict)
    
    # Step 4: Parse JSON string back to dictionary
    parsed_dict = json.loads(json_string)
    
    # Step 5: Serialize again to verify consistency
    json_string_2 = json.dumps(parsed_dict)
    
    # Step 6: Verify round-trip consistency
    assert json_string == json_string_2, "JSON round-trip should produce identical output"
    
    # Step 7: Verify structure is preserved
    assert parsed_dict == json_dict, "Parsed JSON should match original dictionary"
    
    # Step 8: Verify required fields are present
    assert '_metadata' in parsed_dict, "_metadata must be in JSON output"
    assert 'resource_name' in parsed_dict, "resource_name must be in JSON output"
    assert 'subcategory' in parsed_dict, "subcategory must be in JSON output"
    assert 'arguments' in parsed_dict, "arguments must be in JSON output"
    
    # Step 9: Verify arguments structure
    for arg_name, arg_dict in parsed_dict['arguments'].items():
        assert isinstance(arg_dict, dict), f"Argument {arg_name} should be a dictionary"
        assert 'description' in arg_dict, f"Argument {arg_name} must have description"
        assert 'required' in arg_dict, f"Argument {arg_name} must have required field"
        assert 'deprecated' in arg_dict, f"Argument {arg_name} must have deprecated field"
        assert 'parent' in arg_dict, f"Argument {arg_name} must have parent field"
        
        # Verify security fields are present (even if None)
        assert 'security_impact' in arg_dict, f"Argument {arg_name} must have security_impact"
        assert 'rationale' in arg_dict, f"Argument {arg_name} must have rationale"
        assert 'compliant' in arg_dict, f"Argument {arg_name} must have compliant"
        assert 'non_compliant' in arg_dict, f"Argument {arg_name} must have non_compliant"
        
        # Recursively verify nested arguments if present
        if 'arguments' in arg_dict and arg_dict['arguments'] is not None:
            verify_nested_arguments(arg_dict['arguments'])


def verify_nested_arguments(arguments_dict: Dict):
    """
    Helper function to recursively verify nested argument structure.
    
    Args:
        arguments_dict: Dictionary of nested arguments to verify
    """
    assert isinstance(arguments_dict, dict), "Nested arguments should be a dictionary"
    
    for arg_name, arg_dict in arguments_dict.items():
        assert isinstance(arg_dict, dict), f"Nested argument {arg_name} should be a dictionary"
        assert 'description' in arg_dict, f"Nested argument {arg_name} must have description"
        assert 'required' in arg_dict, f"Nested argument {arg_name} must have required field"
        assert 'deprecated' in arg_dict, f"Nested argument {arg_name} must have deprecated field"
        assert 'parent' in arg_dict, f"Nested argument {arg_name} must have parent field"
        
        # Recursively check deeper nesting
        if 'arguments' in arg_dict and arg_dict['arguments'] is not None:
            verify_nested_arguments(arg_dict['arguments'])


# Unit Tests

def test_argument_to_json_dict_basic():
    """Test basic Argument serialization to JSON dictionary."""
    arg = Argument(
        description="Test argument",
        required=True,
        parent=None,
        deprecated=False
    )
    
    result = arg.to_json_dict()
    
    assert result['description'] == "Test argument"
    assert result['required'] is True
    assert result['parent'] is None
    assert result['deprecated'] is False
    assert result['security_impact'] is None
    assert result['rationale'] is None
    assert result['compliant'] is None
    assert result['non_compliant'] is None
    assert 'arguments' not in result  # No nested arguments


def test_argument_to_json_dict_with_nested():
    """Test Argument serialization with nested arguments."""
    nested_arg = Argument(
        description="Nested argument",
        required=False,
        parent="parent_arg",
        deprecated=False
    )
    
    parent_arg = Argument(
        description="Parent argument",
        required=True,
        parent=None,
        deprecated=False,
        arguments={'nested': nested_arg}
    )
    
    result = parent_arg.to_json_dict()
    
    assert 'arguments' in result
    assert 'nested' in result['arguments']
    assert result['arguments']['nested']['description'] == "Nested argument"
    assert result['arguments']['nested']['parent'] == "parent_arg"


def test_resource_to_json_dict_includes_metadata():
    """Test that Resource serialization includes _metadata block."""
    resource = Resource(
        resource_name="aws_s3_bucket",
        subcategory="S3 (Simple Storage)",
        arguments={},
        provider="aws",
        version="5.0.0"
    )
    
    result = resource.to_json_dict()
    
    assert result['resource_name'] == "aws_s3_bucket"
    assert result['subcategory'] == "S3 (Simple Storage)"
    assert result['arguments'] == {}
    
    # Metadata should be in _metadata block
    assert '_metadata' in result
    assert result['_metadata']['provider'] == "aws"
    assert result['_metadata']['version'] == "5.0.0"
    assert 'generated_at' in result['_metadata']
    
    # Verify generated_at is ISO 8601 format
    from datetime import datetime
    try:
        datetime.fromisoformat(result['_metadata']['generated_at'])
    except ValueError:
        pytest.fail("generated_at should be valid ISO 8601 timestamp")


def test_resource_to_json_dict_with_arguments():
    """Test Resource serialization with arguments."""
    arg1 = Argument(description="Arg 1", required=True)
    arg2 = Argument(description="Arg 2", required=False, deprecated=True)
    
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test Service",
        arguments={'arg1': arg1, 'arg2': arg2}
    )
    
    result = resource.to_json_dict()
    
    assert len(result['arguments']) == 2
    assert 'arg1' in result['arguments']
    assert 'arg2' in result['arguments']
    assert result['arguments']['arg1']['description'] == "Arg 1"
    assert result['arguments']['arg2']['deprecated'] is True


if __name__ == '__main__':
    pytest.main([__file__, '-v'])


def test_metadata_timestamp_format_validation():
    """Test that generated_at timestamp is always valid ISO 8601 format."""
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test Service",
        arguments={},
        provider="aws",
        version="5.0.0"
    )
    
    result = resource.to_json_dict()
    
    # Verify _metadata block exists
    assert '_metadata' in result
    assert 'generated_at' in result['_metadata']
    
    # Verify timestamp is valid ISO 8601 format
    from datetime import datetime
    timestamp_str = result['_metadata']['generated_at']
    
    try:
        parsed_timestamp = datetime.fromisoformat(timestamp_str)
        # Verify it's a datetime object (successful parse)
        assert isinstance(parsed_timestamp, datetime)
    except ValueError as e:
        pytest.fail(f"generated_at timestamp '{timestamp_str}' is not valid ISO 8601 format: {e}")
    
    # Verify timestamp includes timezone information
    assert '+' in timestamp_str or 'Z' in timestamp_str or timestamp_str.endswith('+00:00'), \
        "Timestamp should include timezone information"


def test_metadata_block_is_first_key():
    """Test that _metadata block is always the first key in JSON output."""
    resource = Resource(
        resource_name="aws_s3_bucket",
        subcategory="S3 (Simple Storage)",
        arguments={'bucket': Argument(description="Bucket name", required=True)},
        provider="aws",
        version="6.0.0"
    )
    
    result = resource.to_json_dict()
    
    # Get list of keys in order
    keys = list(result.keys())
    
    # Verify _metadata is the first key
    assert len(keys) > 0, "Result should have at least one key"
    assert keys[0] == '_metadata', f"First key should be '_metadata', but got '{keys[0]}'"
    
    # Verify expected structure
    assert keys == ['_metadata', 'resource_name', 'subcategory', 'arguments'], \
        f"Keys should be in order: ['_metadata', 'resource_name', 'subcategory', 'arguments'], but got {keys}"


def test_metadata_with_null_version_includes_field():
    """Test that when version is None, the JSON contains 'version': null (not omitted)."""
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test Service",
        arguments={},
        provider="gcp",
        version=None  # Explicitly set to None
    )
    
    result = resource.to_json_dict()
    
    # Verify _metadata block exists
    assert '_metadata' in result
    
    # Verify version field exists (not omitted)
    assert 'version' in result['_metadata'], \
        "version field should be present in _metadata even when None"
    
    # Verify version is explicitly null
    assert result['_metadata']['version'] is None, \
        f"version should be None, but got {result['_metadata']['version']}"
    
    # Verify other metadata fields are still present
    assert 'provider' in result['_metadata']
    assert 'generated_at' in result['_metadata']
    assert result['_metadata']['provider'] == "gcp"
