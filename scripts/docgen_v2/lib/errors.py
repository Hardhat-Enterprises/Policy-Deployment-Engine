"""
Error handling module for Terraform JSON Spec Generator.

Defines exit codes, custom exception classes, and error formatting utilities
to ensure consistent error reporting with proper context across all components.

Exit Codes:
    1: Configuration errors (invalid arguments, missing parameters)
    2: Connection errors (unable to access provider documentation)
    3: Parsing errors (malformed documentation or schema)
    4: Filesystem errors (unable to create directories or write files)
    5: Validation errors (generated JSON fails validation)

Features:
    - Custom exception classes for each error category
    - Automatic stderr output with detailed context
    - Fail-fast behavior for critical errors
    - Consistent error message formatting

Example:
    >>> from scripts.docgen_v2.lib.errors import ParsingError
    >>> raise ParsingError("Invalid markdown format", resource_name="aws_s3_bucket")

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import sys
from typing import Optional


# Exit code constants
EXIT_SUCCESS = 0
EXIT_CONFIG_ERROR = 1
EXIT_CONNECTION_ERROR = 2
EXIT_PARSING_ERROR = 3
EXIT_FILESYSTEM_ERROR = 4
EXIT_VALIDATION_ERROR = 5


class GeneratorError(Exception):
    """
    Base exception class for all generator errors.
    
    Provides common functionality for error reporting including:
    - Automatic stderr output
    - Context information (resource, file path, operation)
    - Exit code association
    
    Attributes:
        message: Primary error message
        exit_code: Exit code for this error category
        resource_name: Optional resource name for context
        file_path: Optional file path for context
        operation: Optional operation description for context
    """
    
    exit_code = EXIT_SUCCESS  # Override in subclasses
    
    def __init__(
        self,
        message: str,
        resource_name: Optional[str] = None,
        file_path: Optional[str] = None,
        operation: Optional[str] = None
    ):
        """
        Initialize error with message and optional context.
        
        Args:
            message: Primary error message
            resource_name: Optional resource name for context
            file_path: Optional file path for context
            operation: Optional operation description for context
        """
        self.message = message
        self.resource_name = resource_name
        self.file_path = file_path
        self.operation = operation
        
        # Build full error message with context
        full_message = self._format_error_message()
        super().__init__(full_message)
    
    def _format_error_message(self) -> str:
        """
        Format error message with category and context.
        
        Returns:
            str: Formatted error message with all available context
        """
        parts = [f"[{self.__class__.__name__}] {self.message}"]
        
        if self.resource_name:
            parts.append(f"Resource: {self.resource_name}")
        
        if self.file_path:
            parts.append(f"File: {self.file_path}")
        
        if self.operation:
            parts.append(f"Operation: {self.operation}")
        
        return " | ".join(parts)
    
    def write_to_stderr(self) -> None:
        """
        Write error message to stderr.
        
        This method is called automatically when the error is raised
        in fail-fast mode, but can also be called manually for logging.
        """
        sys.stderr.write(f"{str(self)}\n")
        sys.stderr.flush()


class ConfigurationError(GeneratorError):
    """
    Configuration error (exit code 1).
    
    Raised when command-line arguments are invalid, required parameters
    are missing, or configuration validation fails.
    
    Examples:
        - Invalid CSP identifier
        - Output directory path is a file
        - Missing required configuration
    
    Example:
        >>> raise ConfigurationError(
        ...     "Invalid CSP identifier",
        ...     operation="argument validation"
        ... )
    """
    exit_code = EXIT_CONFIG_ERROR


class ConnectionError(GeneratorError):
    """
    Connection error (exit code 2).
    
    Raised when unable to access Terraform provider documentation,
    including git repository cloning failures and network issues.
    
    Examples:
        - Git clone failure
        - Network timeout
        - Repository not found
        - Authentication failure
    
    Example:
        >>> raise ConnectionError(
        ...     "Failed to clone provider repository",
        ...     operation="git clone",
        ...     file_path="https://github.com/hashicorp/terraform-provider-aws"
        ... )
    """
    exit_code = EXIT_CONNECTION_ERROR


class ParsingError(GeneratorError):
    """
    Parsing error (exit code 3).
    
    Raised when provider documentation is malformed or cannot be parsed,
    including markdown format issues and missing required sections.
    
    Examples:
        - Malformed markdown structure
        - Missing argument reference section
        - Invalid YAML frontmatter
        - Unparseable argument format
    
    Example:
        >>> raise ParsingError(
        ...     "Missing argument reference section",
        ...     resource_name="aws_s3_bucket",
        ...     file_path="/path/to/aws_s3_bucket.html.markdown"
        ... )
    """
    exit_code = EXIT_PARSING_ERROR


class FilesystemError(GeneratorError):
    """
    Filesystem error (exit code 4).
    
    Raised when unable to create directories, write files, or perform
    other filesystem operations.
    
    Examples:
        - Permission denied creating directory
        - Disk full when writing file
        - Path is read-only
        - File already exists (when not expected)
    
    Example:
        >>> raise FilesystemError(
        ...     "Permission denied",
        ...     operation="create directory",
        ...     file_path="/path/to/output/dir"
        ... )
    """
    exit_code = EXIT_FILESYSTEM_ERROR


class ValidationError(GeneratorError):
    """
    Validation error (exit code 5).
    
    Raised when generated JSON fails validation checks, including
    missing required fields, invalid parent references, or type errors.
    
    Examples:
        - Missing required field
        - Invalid parent reference
        - Type mismatch (e.g., required field not boolean)
        - Malformed JSON structure
    
    Example:
        >>> raise ValidationError(
        ...     "Missing required field 'description'",
        ...     resource_name="aws_s3_bucket",
        ...     operation="argument validation"
        ... )
    """
    exit_code = EXIT_VALIDATION_ERROR


def fail_fast(error: GeneratorError) -> None:
    """
    Handle critical error with fail-fast behavior.
    
    Writes error to stderr and exits immediately with the appropriate
    exit code. This function should be called for critical errors that
    prevent further processing.
    
    Args:
        error: GeneratorError instance to handle
    
    Example:
        >>> try:
        ...     # Some critical operation
        ...     pass
        ... except Exception as e:
        ...     error = ConfigurationError("Invalid configuration")
        ...     fail_fast(error)
    
    Note:
        This function does not return - it exits the process.
    """
    error.write_to_stderr()
    sys.exit(error.exit_code)


def format_error_context(
    message: str,
    resource_name: Optional[str] = None,
    file_path: Optional[str] = None,
    operation: Optional[str] = None
) -> str:
    """
    Format error message with context information.
    
    Utility function for creating consistent error messages with context
    when not using exception classes.
    
    Args:
        message: Primary error message
        resource_name: Optional resource name for context
        file_path: Optional file path for context
        operation: Optional operation description for context
    
    Returns:
        str: Formatted error message with context
    
    Example:
        >>> msg = format_error_context(
        ...     "Failed to process",
        ...     resource_name="aws_s3_bucket",
        ...     operation="schema extraction"
        ... )
        >>> print(msg)
        Failed to process | Resource: aws_s3_bucket | Operation: schema extraction
    """
    parts = [message]
    
    if resource_name:
        parts.append(f"Resource: {resource_name}")
    
    if file_path:
        parts.append(f"File: {file_path}")
    
    if operation:
        parts.append(f"Operation: {operation}")
    
    return " | ".join(parts)
