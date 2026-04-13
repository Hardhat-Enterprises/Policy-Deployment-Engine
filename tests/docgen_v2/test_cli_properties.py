"""
Property-based tests for CLI argument parsing.

Tests universal properties that should hold for all CLI argument combinations
using Hypothesis for property-based testing. Each test runs 100+ iterations
with randomly generated inputs.

Properties Tested:
    - Property 4: Invalid CSP identifiers are rejected
    - Property 24: Invalid configuration is rejected

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
from hypothesis import given, strategies as st, settings
from pathlib import Path
import sys
from io import StringIO
from scripts.docgen_v2.lib.cli import parse_arguments, validate_arguments
import argparse


# Hypothesis strategies for generating test data

@st.composite
def valid_csp(draw):
    """Generate valid CSP identifiers."""
    return draw(st.sampled_from(['aws', 'azure', 'gcp']))


@st.composite
def invalid_csp(draw):
    """Generate invalid CSP identifiers."""
    # Generate strings that are NOT in the valid set
    invalid = draw(st.text(min_size=1, max_size=20).filter(
        lambda x: x not in ['aws', 'azure', 'gcp'] and x.strip() == x
    ))
    return invalid


@st.composite
def service_list(draw):
    """Generate list of service names."""
    return draw(st.lists(
        st.text(min_size=1, max_size=30, alphabet=st.characters(
            whitelist_categories=('Lu', 'Ll', 'Nd'),
            whitelist_characters='_'
        )).filter(lambda x: not x.startswith('-')),  # Avoid argparse flags
        min_size=1,
        max_size=5
    ))


@st.composite
def resource_list(draw):
    """Generate list of resource names."""
    return draw(st.lists(
        st.text(min_size=1, max_size=50, alphabet=st.characters(
            whitelist_categories=('Lu', 'Ll', 'Nd'),
            whitelist_characters='_'
        )).filter(lambda x: not x.startswith('-')),  # Avoid argparse flags
        min_size=1,
        max_size=5
    ))


# Property Tests

@pytest.mark.property
@given(invalid_csp=invalid_csp())
@settings(max_examples=100)
def test_property_4_invalid_csp_rejected(invalid_csp):
    """
    Feature: terraform-json-generator, Property 4: Invalid CSP identifiers are rejected
    
    For any string that is not in the set {aws, azure, gcp}, the Generator
    should reject it and report an error.
    
    Validates: Requirements 1.5
    
    This property ensures that only valid cloud service providers are accepted,
    preventing configuration errors and ensuring the generator only processes
    supported providers.
    """
    # Attempt to parse arguments with invalid CSP
    with pytest.raises(SystemExit) as exc_info:
        parse_arguments(['--csp', invalid_csp])
    
    # Should exit with error code (argparse exits with 2 for invalid arguments)
    assert exc_info.value.code != 0, \
        f"Invalid CSP '{invalid_csp}' should be rejected but was accepted"


@pytest.mark.property
@given(csp=valid_csp())
@settings(max_examples=100)
def test_property_24_minimal_valid_configuration(csp):
    """
    Feature: terraform-json-generator, Property 24: Invalid configuration is rejected
    
    For any valid minimal configuration (just --csp), the Generator should
    accept it and use default values for optional parameters.
    
    Validates: Requirements 8.5, 8.2
    
    This property ensures that the minimal required configuration is accepted
    and defaults are properly applied.
    """
    # Minimal valid configuration
    args = ['--csp', csp]
    
    # Should parse successfully
    parsed = parse_arguments(args)
    
    # Verify parsed values and defaults
    assert parsed.csp == csp
    assert parsed.service is None  # No services specified
    assert parsed.output_dir == Path('docs/')  # Default output directory
    assert parsed.dry_run is True  # Default dry-run mode
    assert parsed.silent is False  # Default not silent


@pytest.mark.property
def test_property_24_output_dir_file_rejected(tmp_path):
    """
    Feature: terraform-json-generator, Property 24: Invalid configuration is rejected
    
    For any configuration where the output directory path exists as a file
    (not a directory), the Generator should reject it.
    
    Validates: Requirements 8.5
    
    This property ensures that the output path validation catches cases where
    a file exists at the specified output directory path.
    """
    # Create a file at the output path
    output_file = tmp_path / "output.txt"
    output_file.write_text("test")
    
    # Try to use this file path as output directory
    args = ['--csp', 'aws', '--output-dir', str(output_file)]
    
    # Should exit with configuration error
    with pytest.raises(SystemExit) as exc_info:
        parse_arguments(args)
    
    # Should exit with code 1 (configuration error)
    assert exc_info.value.code == 1, \
        "Configuration with file path as output directory should be rejected"


@pytest.mark.property
@given(
    csp=valid_csp(),
    services=service_list()
)
@settings(max_examples=100)
def test_property_24_service_without_resource_accepted(csp, services):
    """
    Feature: terraform-json-generator, Property 24: Invalid configuration is rejected
    
    For any configuration with --service but no --resource, the Generator
    should accept it (this is a valid configuration).
    
    Validates: Requirements 8.5, 8.4
    
    This property ensures that specifying services without specific resources
    is valid and accepted (it means process all resources in those services).
    """
    # Build arguments with --service but no --resource
    args = ['--csp', csp, '--service'] + services
    
    # Should parse successfully
    parsed = parse_arguments(args)
    
    # Verify parsed values
    assert parsed.csp == csp
    assert parsed.service == services


@pytest.mark.property
@given(csp=valid_csp())
@settings(max_examples=100)
def test_property_24_dry_run_default_behavior(csp):
    """
    Feature: terraform-json-generator, Property 24: Invalid configuration is rejected
    
    For any configuration without explicit --dry-run or --no-dry-run flags,
    the Generator should default to dry-run mode for safety.
    
    Validates: Requirements 8.5, 8.6
    
    This property ensures that the safe default (dry-run) is applied when
    no execution mode is explicitly specified.
    """
    # Configuration without execution mode flags
    args = ['--csp', csp]
    
    parsed = parse_arguments(args)
    
    # Should default to dry-run mode
    assert parsed.dry_run is True, \
        "Default execution mode should be dry-run for safety"


@pytest.mark.property
@given(csp=valid_csp())
@settings(max_examples=100)
def test_property_24_no_dry_run_flag_works(csp):
    """
    Feature: terraform-json-generator, Property 24: Invalid configuration is rejected
    
    For any configuration with --no-dry-run flag, the Generator should
    disable dry-run mode and prepare for actual execution.
    
    Validates: Requirements 8.5
    
    This property ensures that users can explicitly opt out of dry-run mode
    when they want to actually write files.
    """
    # Configuration with --no-dry-run
    args = ['--csp', csp, '--no-dry-run']
    
    parsed = parse_arguments(args)
    
    # Should disable dry-run mode
    assert parsed.dry_run is False, \
        "--no-dry-run flag should disable dry-run mode"


# Unit tests for specific edge cases

@pytest.mark.unit
def test_empty_service_list_rejected():
    """Test that empty service list is handled correctly."""
    # argparse with nargs='+' should reject empty lists
    # This is handled by argparse itself
    with pytest.raises(SystemExit):
        parse_arguments(['--csp', 'aws', '--service'])





@pytest.mark.unit
def test_missing_required_csp():
    """Test that missing --csp argument is rejected."""
    with pytest.raises(SystemExit):
        parse_arguments([])


@pytest.mark.unit
def test_silent_flag():
    """Test that --silent flag is parsed correctly."""
    args = parse_arguments(['--csp', 'aws', '--silent'])
    assert args.silent is True
    
    # Test default (not silent)
    args_default = parse_arguments(['--csp', 'aws'])
    assert args_default.silent is False


@pytest.mark.unit
def test_provider_version_parsing():
    """Test that --provider-version is parsed correctly."""
    args = parse_arguments(['--csp', 'aws', '--provider-version', '5.70.0'])
    assert args.provider_version == '5.70.0'


@pytest.mark.unit
def test_output_dir_parsing():
    """Test that --output-dir is parsed correctly as Path."""
    args = parse_arguments(['--csp', 'aws', '--output-dir', '/tmp/output'])
    assert args.output_dir == Path('/tmp/output')
    assert isinstance(args.output_dir, Path)
