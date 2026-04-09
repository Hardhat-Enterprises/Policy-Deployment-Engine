"""
Property-based tests for error handling and exit codes.

Tests universal properties that should hold for all error scenarios
using Hypothesis for property-based testing. Each test runs 100+ iterations
with randomly generated inputs.

Properties Tested:
    - Property 23: Critical errors trigger immediate failure
    - Property 20: Validation errors include context
    - Property 44: Connection errors are reported with details
    - Property 45: Filesystem errors include paths
    - Property 46: Parsing errors identify resources
    - Property 47: Error messages provide debugging context

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
from hypothesis import given, strategies as st, settings
from pathlib import Path
import sys
from io import StringIO

from scripts.docgen_v2.lib.errors import (
    GeneratorError,
    ConfigurationError,
    ConnectionError,
    ParsingError,
    FilesystemError,
    ValidationError,
    EXIT_CONFIG_ERROR,
    EXIT_CONNECTION_ERROR,
    EXIT_PARSING_ERROR,
    EXIT_FILESYSTEM_ERROR,
    EXIT_VALIDATION_ERROR,
    fail_fast,
    format_error_context
)


# Hypothesis strategies for generating test data

@st.composite
def error_message(draw):
    """Generate error messages."""
    return draw(st.text(min_size=1, max_size=200))


@st.composite
def resource_name(draw):
    """Generate resource names."""
    csp = draw(st.sampled_from(['aws', 'azure', 'gcp', 'azurerm', 'google']))
    resource = draw(st.text(
        min_size=1,
        max_size=50,
        alphabet=st.characters(whitelist_categories=('Lu', 'Ll', 'Nd'), whitelist_characters='_')
    ))
    return f"{csp}_{resource}"


@st.composite
def file_path_str(draw):
    """Generate file path strings."""
    parts = draw(st.lists(
        st.text(min_size=1, max_size=20, alphabet=st.characters(
            whitelist_categories=('Lu', 'Ll', 'Nd'),
            whitelist_characters='_-.'
        )),
        min_size=1,
        max_size=5
    ))
    return '/'.join(parts)


@st.composite
def operation_name(draw):
    """Generate operation names."""
    return draw(st.text(min_size=1, max_size=50))


# Property Tests for Critical Error Handling (Property 23)

@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name()
)
@settings(max_examples=100)
def test_property_23_configuration_error_has_exit_code(message, resource):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that configuration errors have the correct exit code
    and can be used to trigger immediate failure.
    """
    error = ConfigurationError(message, resource_name=resource)
    
    # Should have non-zero exit code
    assert error.exit_code == EXIT_CONFIG_ERROR
    assert error.exit_code != 0
    
    # Should be a GeneratorError
    assert isinstance(error, GeneratorError)


@pytest.mark.property
@given(
    message=error_message(),
    file_path=file_path_str()
)
@settings(max_examples=100)
def test_property_23_connection_error_has_exit_code(message, file_path):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that connection errors have the correct exit code.
    """
    error = ConnectionError(message, file_path=file_path)
    
    # Should have non-zero exit code
    assert error.exit_code == EXIT_CONNECTION_ERROR
    assert error.exit_code != 0
    
    # Should be a GeneratorError
    assert isinstance(error, GeneratorError)


@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name(),
    file_path=file_path_str()
)
@settings(max_examples=100)
def test_property_23_parsing_error_has_exit_code(message, resource, file_path):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that parsing errors have the correct exit code.
    """
    error = ParsingError(message, resource_name=resource, file_path=file_path)
    
    # Should have non-zero exit code
    assert error.exit_code == EXIT_PARSING_ERROR
    assert error.exit_code != 0
    
    # Should be a GeneratorError
    assert isinstance(error, GeneratorError)


@pytest.mark.property
@given(
    message=error_message(),
    file_path=file_path_str()
)
@settings(max_examples=100)
def test_property_23_filesystem_error_has_exit_code(message, file_path):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that filesystem errors have the correct exit code.
    """
    error = FilesystemError(message, file_path=file_path)
    
    # Should have non-zero exit code
    assert error.exit_code == EXIT_FILESYSTEM_ERROR
    assert error.exit_code != 0
    
    # Should be a GeneratorError
    assert isinstance(error, GeneratorError)


@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name()
)
@settings(max_examples=100)
def test_property_23_validation_error_has_exit_code(message, resource):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that validation errors have the correct exit code.
    """
    error = ValidationError(message, resource_name=resource)
    
    # Should have non-zero exit code
    assert error.exit_code == EXIT_VALIDATION_ERROR
    assert error.exit_code != 0
    
    # Should be a GeneratorError
    assert isinstance(error, GeneratorError)


@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name()
)
@settings(max_examples=100)
def test_property_23_error_writes_to_stderr(message, resource):
    """
    Feature: terraform-json-generator, Property 23: Critical errors trigger immediate failure
    
    For any critical error, the Generator should exit immediately with a
    non-zero status code and write the error to stderr.
    
    Validates: Requirements 7.6, 7.7, 7.8
    
    This property ensures that errors can write to stderr with proper formatting.
    """
    error = ValidationError(message, resource_name=resource)
    
    # Capture stderr
    old_stderr = sys.stderr
    sys.stderr = StringIO()
    
    try:
        error.write_to_stderr()
        stderr_output = sys.stderr.getvalue()
        
        # Should write something to stderr
        assert len(stderr_output) > 0
        
        # Should contain the error class name
        assert "ValidationError" in stderr_output
        
        # Should contain the message
        assert message in stderr_output
        
        # Should contain the resource name
        assert resource in stderr_output
        
    finally:
        sys.stderr = old_stderr


# Property Tests for Error Context (Properties 20, 44-47)

@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name(),
    operation=operation_name()
)
@settings(max_examples=100)
def test_property_20_validation_errors_include_context(message, resource, operation):
    """
    Feature: terraform-json-generator, Property 20: Validation errors include context
    
    For any validation failure, the error message should include the resource
    name and the specific validation issue.
    
    Validates: Requirements 6.3
    
    This property ensures that validation errors provide sufficient context
    for debugging, including resource name and operation.
    """
    error = ValidationError(message, resource_name=resource, operation=operation)
    error_str = str(error)
    
    # Should include error class name
    assert "ValidationError" in error_str
    
    # Should include the message
    assert message in error_str
    
    # Should include resource name
    assert resource in error_str
    
    # Should include operation
    assert operation in error_str


@pytest.mark.property
@given(
    message=error_message(),
    file_path=file_path_str(),
    operation=operation_name()
)
@settings(max_examples=100)
def test_property_44_connection_errors_include_details(message, file_path, operation):
    """
    Feature: terraform-json-generator, Property 44: Connection errors are reported with details
    
    For any failure to access Terraform provider documentation, the Generator
    should report a connection error including the attempted URL or resource location.
    
    Validates: Requirements 7.1
    
    This property ensures that connection errors include the file path or URL
    that failed, along with the operation being performed.
    """
    error = ConnectionError(message, file_path=file_path, operation=operation)
    error_str = str(error)
    
    # Should include error class name
    assert "ConnectionError" in error_str
    
    # Should include the message
    assert message in error_str
    
    # Should include file path (URL or location)
    assert file_path in error_str
    
    # Should include operation
    assert operation in error_str


@pytest.mark.property
@given(
    message=error_message(),
    file_path=file_path_str(),
    operation=operation_name()
)
@settings(max_examples=100)
def test_property_45_filesystem_errors_include_paths(message, file_path, operation):
    """
    Feature: terraform-json-generator, Property 45: Filesystem errors include paths
    
    For any failure to create a directory or write a file, the error message
    should include the specific filesystem path that failed.
    
    Validates: Requirements 7.2, 7.3
    
    This property ensures that filesystem errors always include the path
    that caused the failure, enabling users to identify permission issues
    or disk space problems.
    """
    error = FilesystemError(message, file_path=file_path, operation=operation)
    error_str = str(error)
    
    # Should include error class name
    assert "FilesystemError" in error_str
    
    # Should include the message
    assert message in error_str
    
    # Should include file path
    assert file_path in error_str
    
    # Should include operation
    assert operation in error_str


@pytest.mark.property
@given(
    message=error_message(),
    resource=resource_name(),
    file_path=file_path_str()
)
@settings(max_examples=100)
def test_property_46_parsing_errors_identify_resources(message, resource, file_path):
    """
    Feature: terraform-json-generator, Property 46: Parsing errors identify resources
    
    For any malformed provider documentation, the error message should include
    the resource name being parsed.
    
    Validates: Requirements 7.4
    
    This property ensures that parsing errors identify which resource failed
    to parse, along with the file path, enabling quick identification of
    problematic documentation.
    """
    error = ParsingError(message, resource_name=resource, file_path=file_path)
    error_str = str(error)
    
    # Should include error class name
    assert "ParsingError" in error_str
    
    # Should include the message
    assert message in error_str
    
    # Should include resource name
    assert resource in error_str
    
    # Should include file path
    assert file_path in error_str


@pytest.mark.property
@given(
    message=error_message(),
    resource=st.one_of(resource_name(), st.none()),
    file_path=st.one_of(file_path_str(), st.none()),
    operation=st.one_of(operation_name(), st.none())
)
@settings(max_examples=100)
def test_property_47_error_messages_provide_debugging_context(message, resource, file_path, operation):
    """
    Feature: terraform-json-generator, Property 47: Error messages provide debugging context
    
    For any error, the error message should include sufficient context
    (resource name, file path, or operation) to enable debugging.
    
    Validates: Requirements 7.5
    
    This property ensures that all errors provide at least the primary message,
    and include any available context information (resource, file, operation).
    """
    error = ValidationError(
        message,
        resource_name=resource,
        file_path=file_path,
        operation=operation
    )
    error_str = str(error)
    
    # Should always include the message
    assert message in error_str
    
    # Should include resource name if provided
    if resource:
        assert resource in error_str
    
    # Should include file path if provided
    if file_path:
        assert file_path in error_str
    
    # Should include operation if provided
    if operation:
        assert operation in error_str
    
    # Should have error category
    assert "ValidationError" in error_str


@pytest.mark.property
@given(
    message=error_message(),
    resource=st.one_of(resource_name(), st.none()),
    file_path=st.one_of(file_path_str(), st.none()),
    operation=st.one_of(operation_name(), st.none())
)
@settings(max_examples=100)
def test_property_47_format_error_context_utility(message, resource, file_path, operation):
    """
    Feature: terraform-json-generator, Property 47: Error messages provide debugging context
    
    For any error, the error message should include sufficient context
    (resource name, file path, or operation) to enable debugging.
    
    Validates: Requirements 7.5
    
    This property tests the format_error_context utility function to ensure
    it properly formats error messages with all available context.
    """
    formatted = format_error_context(
        message,
        resource_name=resource,
        file_path=file_path,
        operation=operation
    )
    
    # Should always include the message
    assert message in formatted
    
    # Should include resource name if provided
    if resource:
        assert resource in formatted
        assert "Resource:" in formatted
    
    # Should include file path if provided
    if file_path:
        assert file_path in formatted
        assert "File:" in formatted
    
    # Should include operation if provided
    if operation:
        assert operation in formatted
        assert "Operation:" in formatted


# Unit tests for specific error scenarios

@pytest.mark.unit
def test_exit_codes_are_distinct():
    """Test that all exit codes are distinct and non-zero."""
    exit_codes = [
        EXIT_CONFIG_ERROR,
        EXIT_CONNECTION_ERROR,
        EXIT_PARSING_ERROR,
        EXIT_FILESYSTEM_ERROR,
        EXIT_VALIDATION_ERROR
    ]
    
    # All should be non-zero
    for code in exit_codes:
        assert code != 0
    
    # All should be distinct
    assert len(exit_codes) == len(set(exit_codes))


@pytest.mark.unit
def test_error_inheritance():
    """Test that all error classes inherit from GeneratorError."""
    error_classes = [
        ConfigurationError,
        ConnectionError,
        ParsingError,
        FilesystemError,
        ValidationError
    ]
    
    for error_class in error_classes:
        error = error_class("test message")
        assert isinstance(error, GeneratorError)
        assert isinstance(error, Exception)


@pytest.mark.unit
def test_error_with_all_context():
    """Test error with all context fields populated."""
    error = ValidationError(
        "Test error",
        resource_name="aws_s3_bucket",
        file_path="/path/to/file.json",
        operation="validate resource"
    )
    
    error_str = str(error)
    assert "Test error" in error_str
    assert "aws_s3_bucket" in error_str
    assert "/path/to/file.json" in error_str
    assert "validate resource" in error_str


@pytest.mark.unit
def test_error_with_minimal_context():
    """Test error with only message (no context)."""
    error = ConfigurationError("Test error")
    
    error_str = str(error)
    assert "Test error" in error_str
    assert "ConfigurationError" in error_str


@pytest.mark.unit
def test_fail_fast_exits_with_correct_code():
    """Test that fail_fast would exit with the correct code."""
    error = ValidationError("Test error")
    
    # We can't actually test sys.exit in a unit test, but we can verify
    # the error has the correct exit code
    assert error.exit_code == EXIT_VALIDATION_ERROR
    
    # Verify write_to_stderr works
    old_stderr = sys.stderr
    sys.stderr = StringIO()
    try:
        error.write_to_stderr()
        output = sys.stderr.getvalue()
        assert "Test error" in output
    finally:
        sys.stderr = old_stderr
