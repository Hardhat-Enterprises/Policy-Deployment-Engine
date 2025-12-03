"""
Property-based tests for ResourceChangeDetector.

These tests verify that change detection correctly identifies all differences
between resource versions using property-based testing with Hypothesis.
"""

import pytest
from hypothesis import given, strategies as st
from scripts.docgen_v2.lib.models import Argument, Resource
from scripts.docgen_v2.lib.resource_change_detector import ResourceChangeDetector


# Strategies for generating test data

@st.composite
def argument_strategy(draw, allow_nested=True, max_depth=3, current_depth=0):
    """
    Generate random Argument objects with optional nesting.
    
    Args:
        draw: Hypothesis draw function
        allow_nested: Whether to allow nested arguments
        max_depth: Maximum nesting depth
        current_depth: Current depth in the tree
    
    Returns:
        Argument: Randomly generated argument
    """
    description = draw(st.text(min_size=1, max_size=100))
    required = draw(st.one_of(st.booleans(), st.none()))
    deprecated = draw(st.booleans())
    
    # Generate nested arguments if allowed and not at max depth
    nested_args = None
    if allow_nested and current_depth < max_depth:
        # Randomly decide whether to have nested arguments
        has_nested = draw(st.booleans())
        if has_nested:
            # Generate 0-3 nested arguments
            num_nested = draw(st.integers(min_value=0, max_value=3))
            if num_nested > 0:
                nested_args = {}
                for i in range(num_nested):
                    arg_name = f"nested_arg_{i}"
                    nested_arg = draw(argument_strategy(
                        allow_nested=True,
                        max_depth=max_depth,
                        current_depth=current_depth + 1
                    ))
                    nested_args[arg_name] = nested_arg
    
    return Argument(
        description=description,
        required=required,
        deprecated=deprecated,
        arguments=nested_args
    )


@st.composite
def resource_strategy(draw, resource_name=None, version=None):
    """
    Generate random Resource objects.
    
    Args:
        draw: Hypothesis draw function
        resource_name: Optional fixed resource name
        version: Optional fixed version
    
    Returns:
        Resource: Randomly generated resource
    """
    if resource_name is None:
        resource_name = draw(st.text(min_size=1, max_size=50))
    
    subcategory = draw(st.text(min_size=1, max_size=50))
    provider = draw(st.sampled_from(["aws", "azure", "gcp"]))
    
    if version is None:
        version = draw(st.text(min_size=1, max_size=20))
    
    # Generate 1-5 top-level arguments
    num_args = draw(st.integers(min_value=1, max_value=5))
    arguments = {}
    for i in range(num_args):
        arg_name = f"arg_{i}"
        arg = draw(argument_strategy(allow_nested=True, max_depth=2))
        arguments[arg_name] = arg
    
    return Resource(
        resource_name=resource_name,
        subcategory=subcategory,
        arguments=arguments,
        provider=provider,
        version=version
    )


# Property-based tests

@given(
    old_resource=resource_strategy(resource_name="test_resource", version="1.0.0"),
    new_resource=resource_strategy(resource_name="test_resource", version="2.0.0")
)
def test_property_32_change_reports_generated_on_updates(old_resource, new_resource):
    """
    Feature: terraform-json-generator, Property 32: Change reports are generated on updates
    
    For any two different versions of a resource, a change report should be generated.
    
    Validates: Requirements 9.6
    """
    detector = ResourceChangeDetector()
    
    # Detect changes between versions
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify report is created
    assert report is not None
    assert report.resource_name == "test_resource"
    assert report.old_version == "1.0.0"
    assert report.new_version == "2.0.0"
    
    # Verify report has the expected structure
    assert isinstance(report.added_arguments, list)
    assert isinstance(report.removed_arguments, list)
    assert isinstance(report.modified_arguments, list)


@given(st.data())
def test_property_33_change_reports_are_complete_additions(data):
    """
    Feature: terraform-json-generator, Property 33: Change reports are complete (additions)
    
    For any resource where arguments are added, the change report should list all added arguments.
    
    Validates: Requirements 9.7
    """
    detector = ResourceChangeDetector()
    
    # Generate old resource with some arguments
    old_resource = data.draw(resource_strategy(resource_name="test_resource", version="1.0.0"))
    
    # Create new resource with same arguments plus additional ones
    new_arguments = dict(old_resource.arguments)
    
    # Add 1-3 new arguments
    num_new = data.draw(st.integers(min_value=1, max_value=3))
    new_arg_names = []
    for i in range(num_new):
        new_arg_name = f"new_arg_{i}"
        new_arg_names.append(new_arg_name)
        new_arguments[new_arg_name] = data.draw(argument_strategy(allow_nested=False))
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory=old_resource.subcategory,
        arguments=new_arguments,
        provider=old_resource.provider,
        version="2.0.0"
    )
    
    # Detect changes
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify all new arguments are reported as added
    for arg_name in new_arg_names:
        assert arg_name in report.added_arguments, \
            f"Added argument {arg_name} should be in change report"
    
    # Verify the count matches
    assert len(report.added_arguments) >= len(new_arg_names), \
        "Change report should include all added arguments"


@given(st.data())
def test_property_33_change_reports_are_complete_removals(data):
    """
    Feature: terraform-json-generator, Property 33: Change reports are complete (removals)
    
    For any resource where arguments are removed, the change report should list all removed arguments.
    
    Validates: Requirements 9.7
    """
    detector = ResourceChangeDetector()
    
    # Generate old resource with some arguments
    old_resource = data.draw(resource_strategy(resource_name="test_resource", version="1.0.0"))
    
    # Ensure we have at least 2 arguments to remove from
    if len(old_resource.arguments) < 2:
        old_resource.arguments["extra_arg_0"] = Argument("Extra", True)
        old_resource.arguments["extra_arg_1"] = Argument("Extra", False)
    
    # Create new resource with some arguments removed
    old_arg_names = list(old_resource.arguments.keys())
    num_to_remove = min(len(old_arg_names) - 1, data.draw(st.integers(min_value=1, max_value=2)))
    removed_arg_names = data.draw(st.lists(
        st.sampled_from(old_arg_names),
        min_size=num_to_remove,
        max_size=num_to_remove,
        unique=True
    ))
    
    new_arguments = {
        k: v for k, v in old_resource.arguments.items()
        if k not in removed_arg_names
    }
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory=old_resource.subcategory,
        arguments=new_arguments,
        provider=old_resource.provider,
        version="2.0.0"
    )
    
    # Detect changes
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify all removed arguments are reported
    for arg_name in removed_arg_names:
        assert arg_name in report.removed_arguments, \
            f"Removed argument {arg_name} should be in change report"
    
    # Verify the count matches
    assert len(report.removed_arguments) >= len(removed_arg_names), \
        "Change report should include all removed arguments"


@given(st.data())
def test_property_33_change_reports_are_complete_modifications(data):
    """
    Feature: terraform-json-generator, Property 33: Change reports are complete (modifications)
    
    For any resource where argument properties are modified, the change report should list all modifications.
    
    Validates: Requirements 9.7
    """
    detector = ResourceChangeDetector()
    
    # Generate old resource
    old_resource = data.draw(resource_strategy(resource_name="test_resource", version="1.0.0"))
    
    # Create new resource with same arguments but modified properties
    new_arguments = {}
    modified_args = []
    
    for arg_name, old_arg in old_resource.arguments.items():
        # Randomly decide to modify this argument
        should_modify = data.draw(st.booleans())
        
        if should_modify:
            # Modify at least one property
            new_description = data.draw(st.text(min_size=1, max_size=100))
            new_required = data.draw(st.one_of(st.booleans(), st.none()))
            new_deprecated = data.draw(st.booleans())
            
            # Ensure at least one property actually changed
            if (new_description == old_arg.description and 
                new_required == old_arg.required and 
                new_deprecated == old_arg.deprecated):
                # Force a change
                new_description = old_arg.description + "_modified"
            
            new_arguments[arg_name] = Argument(
                description=new_description,
                required=new_required,
                deprecated=new_deprecated,
                arguments=old_arg.arguments  # Keep nested structure same
            )
            modified_args.append(arg_name)
        else:
            # Keep argument unchanged
            new_arguments[arg_name] = Argument(
                description=old_arg.description,
                required=old_arg.required,
                deprecated=old_arg.deprecated,
                arguments=old_arg.arguments
            )
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory=old_resource.subcategory,
        arguments=new_arguments,
        provider=old_resource.provider,
        version="2.0.0"
    )
    
    # Detect changes
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify modifications are reported
    if modified_args:
        assert len(report.modified_arguments) > 0, \
            "Change report should include modified arguments"
        
        # Check that modified arguments appear in the report
        modified_paths = {change.argument_path for change in report.modified_arguments}
        for arg_name in modified_args:
            assert arg_name in modified_paths, \
                f"Modified argument {arg_name} should be in change report"


@given(st.data())
def test_property_33_nested_argument_changes_detected(data):
    """
    Feature: terraform-json-generator, Property 33: Change reports are complete (nested changes)
    
    For any resource with nested arguments, changes to nested arguments should be detected.
    
    Validates: Requirements 9.7
    """
    detector = ResourceChangeDetector()
    
    # Create old resource with nested arguments
    nested_arg = Argument(
        description="Nested description",
        required=True,
        arguments={
            "nested_field": Argument("Nested field desc", False)
        }
    )
    
    old_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={
            "parent_arg": nested_arg
        },
        provider="aws",
        version="1.0.0"
    )
    
    # Create new resource with modified nested argument
    modified_nested_arg = Argument(
        description="Nested description",
        required=True,
        arguments={
            "nested_field": Argument("Modified nested field desc", False)
        }
    )
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={
            "parent_arg": modified_nested_arg
        },
        provider="aws",
        version="2.0.0"
    )
    
    # Detect changes
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify nested change is detected
    assert len(report.modified_arguments) > 0, \
        "Nested argument modification should be detected"
    
    # Check that the nested path is correct
    nested_changes = [
        change for change in report.modified_arguments
        if "parent_arg.nested_field" in change.argument_path
    ]
    assert len(nested_changes) > 0, \
        "Change report should include nested argument path"


def test_no_changes_when_resources_identical():
    """
    Test that identical resources produce an empty change report.
    """
    detector = ResourceChangeDetector()
    
    # Create identical resources
    arguments = {
        "arg1": Argument("Description 1", True),
        "arg2": Argument("Description 2", False)
    }
    
    old_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments=arguments,
        provider="aws",
        version="1.0.0"
    )
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments=arguments,
        provider="aws",
        version="2.0.0"
    )
    
    # Detect changes
    report = detector.detect_changes(old_resource, new_resource)
    
    # Verify no changes detected
    assert len(report.added_arguments) == 0
    assert len(report.removed_arguments) == 0
    assert len(report.modified_arguments) == 0
    assert not report.has_changes()


def test_version_information_preserved():
    """
    Test that version information from resources is preserved in the change report.
    """
    detector = ResourceChangeDetector()
    
    old_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"arg1": Argument("Desc", True)},
        provider="aws",
        version="1.0.0"
    )
    
    new_resource = Resource(
        resource_name="test_resource",
        subcategory="Test",
        arguments={"arg1": Argument("Desc", True)},
        provider="aws",
        version="2.0.0"
    )
    
    report = detector.detect_changes(old_resource, new_resource)
    
    assert report.old_version == "1.0.0"
    assert report.new_version == "2.0.0"
    assert report.resource_name == "test_resource"
