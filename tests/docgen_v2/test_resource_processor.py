"""
Property-based tests for Resource Processor.

Tests universal properties that should hold for resource validation and enrichment
using Hypothesis for property-based testing. Each test runs 100+ iterations
with randomly generated inputs.

Properties Tested:
    - Property 12: Parent references are correct
    - Property 21: Parent references are valid
    - Property 22: Required field type validation

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
from hypothesis import given, strategies as st, settings, assume
from scripts.docgen_v2.lib.models import Resource, Argument
from scripts.docgen_v2.lib.resource_processor import ResourceProcessor
from typing import Dict, Optional


# Hypothesis strategies for generating test data

@st.composite
def argument_name(draw):
    """Generate valid argument names."""
    return draw(st.text(
        min_size=1,
        max_size=30,
        alphabet=st.characters(
            whitelist_categories=('Lu', 'Ll', 'Nd'),
            whitelist_characters='_'
        )
    ).filter(lambda x: x[0].isalpha()))  # Must start with letter


@st.composite
def simple_argument(draw, parent=None):
    """Generate a simple argument without nested arguments."""
    return Argument(
        description=draw(st.text(min_size=1, max_size=200)),
        required=draw(st.one_of(st.booleans(), st.none())),
        parent=parent,
        deprecated=draw(st.booleans()),
        security_impact=None,
        rationale=None,
        compliant=None,
        non_compliant=None,
        arguments=None
    )


@st.composite
def nested_argument(draw, max_depth=3, current_depth=0, parent=None):
    """
    Generate an argument that may have nested arguments.
    
    Args:
        max_depth: Maximum nesting depth
        current_depth: Current depth in recursion
        parent: Parent argument name
    """
    arg = Argument(
        description=draw(st.text(min_size=1, max_size=200)),
        required=draw(st.one_of(st.booleans(), st.none())),
        parent=parent,
        deprecated=draw(st.booleans()),
        security_impact=None,
        rationale=None,
        compliant=None,
        non_compliant=None,
        arguments=None
    )
    
    # Randomly add nested arguments if not at max depth
    if current_depth < max_depth:
        should_nest = draw(st.booleans())
        if should_nest:
            num_nested = draw(st.integers(min_value=1, max_value=3))
            nested_args = {}
            for _ in range(num_nested):
                nested_name = draw(argument_name())
                # Avoid duplicate names
                if nested_name not in nested_args:
                    nested_args[nested_name] = draw(
                        nested_argument(max_depth, current_depth + 1, parent=None)
                    )
            if nested_args:
                arg.arguments = nested_args
    
    return arg


@st.composite
def argument_dict(draw, max_args=5, max_depth=3):
    """Generate a dictionary of arguments with potential nesting."""
    num_args = draw(st.integers(min_value=1, max_value=max_args))
    args = {}
    for _ in range(num_args):
        name = draw(argument_name())
        # Avoid duplicate names
        if name not in args:
            args[name] = draw(nested_argument(max_depth=max_depth, current_depth=0, parent=None))
    return args


@st.composite
def valid_resource(draw):
    """Generate a valid resource with arguments."""
    return Resource(
        resource_name=draw(st.text(min_size=1, max_size=50).filter(lambda x: '_' in x or x.isalnum())),
        subcategory=draw(st.text(min_size=1, max_size=100)),
        arguments=draw(argument_dict(max_args=5, max_depth=2)),
        provider=draw(st.sampled_from(['aws', 'azure', 'gcp'])),
        version=draw(st.text(min_size=1, max_size=20))
    )


@st.composite
def invalid_required_type_argument(draw):
    """Generate an argument with invalid required field type."""
    # Create argument with invalid required type
    arg = Argument(
        description=draw(st.text(min_size=1, max_size=200)),
        required=None,  # Will be replaced with invalid type
        parent=None,
        deprecated=draw(st.booleans()),
        security_impact=None,
        rationale=None,
        compliant=None,
        non_compliant=None,
        arguments=None
    )
    
    # Set required to an invalid type (not bool or None)
    invalid_type = draw(st.one_of(
        st.integers(),
        st.text(),
        st.lists(st.booleans()),
        st.floats(allow_nan=False, allow_infinity=False)
    ))
    arg.required = invalid_type
    
    return arg


# Property Tests

@pytest.mark.property
@given(resource=valid_resource())
@settings(max_examples=100)
def test_property_12_parent_references_correct(resource):
    """
    Feature: terraform-json-generator, Property 12: Parent references are correct
    
    For any nested argument, its `parent` field should match the name of its
    actual parent argument; for any top-level argument, its `parent` field
    should be null.
    
    Validates: Requirements 3.5, 4.2, 4.3
    
    This property ensures that after calling set_parent_references, all
    arguments have correct parent pointers that accurately reflect the
    argument hierarchy.
    """
    # Set parent references
    ResourceProcessor.set_parent_references(resource)
    
    # Verify all top-level arguments have parent=None
    for arg_name, argument in resource.arguments.items():
        assert argument.parent is None, \
            f"Top-level argument '{arg_name}' should have parent=None, got '{argument.parent}'"
        
        # Verify nested arguments have correct parent
        if argument.arguments:
            _verify_nested_parents(argument.arguments, arg_name, resource.resource_name)


def _verify_nested_parents(arguments: Dict[str, Argument], expected_parent: str, resource_name: str):
    """Helper to recursively verify parent references."""
    for arg_name, argument in arguments.items():
        assert argument.parent == expected_parent, \
            f"Nested argument '{arg_name}' in resource '{resource_name}' should have " \
            f"parent='{expected_parent}', got '{argument.parent}'"
        
        # Recursively check deeper nesting
        if argument.arguments:
            _verify_nested_parents(argument.arguments, arg_name, resource_name)


@pytest.mark.property
@given(resource=valid_resource())
@settings(max_examples=100)
def test_property_21_parent_references_valid(resource):
    """
    Feature: terraform-json-generator, Property 21: Parent references are valid
    
    For any nested argument with a non-null parent field, the parent argument
    should exist in the argument structure.
    
    Validates: Requirements 6.4
    
    This property ensures that validation catches invalid parent references
    where an argument claims to have a parent that doesn't exist in the
    resource structure.
    """
    # Set parent references (should create valid structure)
    ResourceProcessor.set_parent_references(resource)
    
    # Validate structure
    errors = ResourceProcessor.validate_structure(resource)
    
    # Filter for parent reference errors
    parent_errors = [e for e in errors if 'non-existent parent' in e]
    
    # Should have no parent reference errors for valid structure
    assert len(parent_errors) == 0, \
        f"Valid resource should not have parent reference errors: {parent_errors}"


@pytest.mark.property
@given(resource=valid_resource())
@settings(max_examples=100)
def test_property_21_invalid_parent_detected(resource):
    """
    Feature: terraform-json-generator, Property 21: Parent references are valid
    
    For any argument with an invalid parent reference (pointing to non-existent
    argument), validation should detect and report the error.
    
    Validates: Requirements 6.4
    
    This property tests the negative case: validation should catch invalid
    parent references.
    """
    # Set parent references first
    ResourceProcessor.set_parent_references(resource)
    
    # Corrupt a parent reference if we have nested arguments
    corrupted = False
    for arg_name, argument in resource.arguments.items():
        if argument.arguments:
            # Pick first nested argument and give it invalid parent
            first_nested = next(iter(argument.arguments.values()))
            first_nested.parent = "nonexistent_parent_xyz_123"
            corrupted = True
            break
    
    # Only test if we successfully corrupted a reference
    assume(corrupted)
    
    # Validate structure
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect the invalid parent reference
    parent_errors = [e for e in errors if 'non-existent parent' in e and 'nonexistent_parent_xyz_123' in e]
    assert len(parent_errors) > 0, \
        "Validation should detect invalid parent reference"


@pytest.mark.property
@given(resource=valid_resource())
@settings(max_examples=100)
def test_property_22_required_field_type_valid(resource):
    """
    Feature: terraform-json-generator, Property 22: Required field type validation
    
    For any argument's `required` field, its value should be either a boolean
    or null, never any other type.
    
    Validates: Requirements 6.5
    
    This property ensures that validation accepts only boolean or null values
    for the required field, rejecting any other types.
    """
    # Set parent references
    ResourceProcessor.set_parent_references(resource)
    
    # Validate structure
    errors = ResourceProcessor.validate_structure(resource)
    
    # Filter for required field type errors
    required_type_errors = [e for e in errors if 'invalid \'required\' field type' in e]
    
    # Should have no required field type errors for valid structure
    assert len(required_type_errors) == 0, \
        f"Valid resource should not have required field type errors: {required_type_errors}"


@pytest.mark.property
@given(resource=valid_resource())
@settings(max_examples=100)
def test_property_22_invalid_required_type_detected(resource):
    """
    Feature: terraform-json-generator, Property 22: Required field type validation
    
    For any argument with an invalid required field type (not boolean or null),
    validation should detect and report the error.
    
    Validates: Requirements 6.5
    
    This property tests the negative case: validation should catch invalid
    required field types.
    """
    # Set parent references first
    ResourceProcessor.set_parent_references(resource)
    
    # Corrupt a required field type
    corrupted = False
    for arg_name, argument in resource.arguments.items():
        # Set required to an invalid type
        argument.required = "invalid_string_type"
        corrupted = True
        break
    
    # Only test if we successfully corrupted a field
    assume(corrupted)
    
    # Validate structure
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect the invalid required field type
    required_type_errors = [e for e in errors if 'invalid \'required\' field type' in e]
    assert len(required_type_errors) > 0, \
        f"Validation should detect invalid required field type, got errors: {errors}"


# Unit tests for specific edge cases

@pytest.mark.unit
def test_empty_resource_arguments():
    """Test resource with empty arguments dictionary."""
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={},
        provider="aws",
        version="1.0.0"
    )
    
    ResourceProcessor.set_parent_references(resource)
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should have no errors for empty but valid structure
    assert len(errors) == 0


@pytest.mark.unit
def test_deeply_nested_arguments():
    """Test resource with deeply nested arguments (5 levels)."""
    # Build nested structure
    level5 = Argument("Level 5", False)
    level4 = Argument("Level 4", False, arguments={"level5": level5})
    level3 = Argument("Level 3", False, arguments={"level4": level4})
    level2 = Argument("Level 2", False, arguments={"level3": level3})
    level1 = Argument("Level 1", False, arguments={"level2": level2})
    
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"level1": level1},
        provider="aws",
        version="1.0.0"
    )
    
    ResourceProcessor.set_parent_references(resource)
    
    # Verify parent chain
    assert resource.arguments["level1"].parent is None
    assert resource.arguments["level1"].arguments["level2"].parent == "level1"
    assert resource.arguments["level1"].arguments["level2"].arguments["level3"].parent == "level2"
    assert resource.arguments["level1"].arguments["level2"].arguments["level3"].arguments["level4"].parent == "level3"
    assert resource.arguments["level1"].arguments["level2"].arguments["level3"].arguments["level4"].arguments["level5"].parent == "level4"
    
    errors = ResourceProcessor.validate_structure(resource)
    assert len(errors) == 0


@pytest.mark.unit
def test_missing_required_fields():
    """Test validation detects missing required fields."""
    # Create a mock argument object that's missing required fields
    # We can't use delattr on dataclass with defaults, so we create a minimal object
    class IncompleteArgument:
        """Mock argument missing required fields."""
        def __init__(self):
            self.description = "Test"
            self.required = True
            # Missing: deprecated, parent, security_impact, rationale, compliant, non_compliant
            self.arguments = None
    
    arg = IncompleteArgument()
    
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"test_arg": arg},
        provider="aws",
        version="1.0.0"
    )
    
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect missing deprecated field
    assert any('missing required field \'deprecated\'' in e for e in errors), \
        f"Expected to find missing 'deprecated' field error, got: {errors}"
    # Should also detect missing parent field
    assert any('missing required field \'parent\'' in e for e in errors), \
        f"Expected to find missing 'parent' field error, got: {errors}"


@pytest.mark.unit
def test_null_description_detected():
    """Test validation detects null description."""
    arg = Argument(
        description=None,  # Invalid: description should not be null
        required=True
    )
    
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"test_arg": arg},
        provider="aws",
        version="1.0.0"
    )
    
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect null description
    assert any('has null \'description\' field' in e for e in errors)


@pytest.mark.unit
def test_multiple_validation_errors():
    """Test that validation reports all errors, not just the first one."""
    # Create resource with multiple issues
    arg1 = Argument(description=None, required="invalid")  # Null description, invalid required type
    arg2 = Argument(description="Test", required=True, parent="nonexistent")  # Invalid parent
    
    resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"arg1": arg1, "arg2": arg2},
        provider="aws",
        version="1.0.0"
    )
    
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should report multiple errors
    assert len(errors) >= 3  # At least: null description, invalid required type, invalid parent
    assert any('null \'description\'' in e for e in errors)
    assert any('invalid \'required\' field type' in e for e in errors)
    assert any('non-existent parent' in e for e in errors)


@pytest.mark.unit
def test_missing_resource_name():
    """Test validation detects missing resource_name."""
    resource = Resource(
        resource_name="",  # Empty resource name
        subcategory="Test",
        arguments={},
        provider="aws",
        version="1.0.0"
    )
    
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect missing resource_name
    assert any('missing required field \'resource_name\'' in e for e in errors)


@pytest.mark.unit
def test_missing_subcategory():
    """Test validation detects missing subcategory."""
    resource = Resource(
        resource_name="test_resource",
        subcategory="",  # Empty subcategory
        arguments={},
        provider="aws",
        version="1.0.0"
    )
    
    errors = ResourceProcessor.validate_structure(resource)
    
    # Should detect missing subcategory
    assert any('missing required field \'subcategory\'' in e for e in errors)

