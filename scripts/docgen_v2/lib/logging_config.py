"""
Logging configuration for the Terraform JSON Spec Generator.

Provides centralized logging setup with file and console output.
- Console: INFO/WARNING to stdout, ERROR to stderr (no timestamps)
- File: DEBUG+ to timestamped log file (with timestamps)

Example:
    >>> from scripts.docgen_v2.lib.logging_config import setup_logging
    >>> import logging
    >>> setup_logging(silent=False)
    >>> logger = logging.getLogger(__name__)
    >>> logger.info("Processing started")
"""

import logging
import sys
from datetime import datetime
from pathlib import Path
from typing import Optional


def setup_logging(silent: bool = False) -> Path:
    """
    Configure logging with both console and file output.
    
    Console output:
    - Default: INFO/WARNING to stdout, ERROR to stderr (no timestamps)
    - Silent mode: No stdout, ERROR still to stderr
    
    File output:
    - Always: DEBUG+ to timestamped log file (with timestamps)
    - Location: scripts/docgen_v2/logs/generator-{timestamp}.log
    
    Args:
        silent: If True, suppress all console output except ERROR to stderr
    
    Returns:
        Path: Path to the log file created for this run
    
    Example:
        >>> log_file = setup_logging(silent=False)
        >>> logger = logging.getLogger(__name__)
        >>> logger.info("Processing resource")  # Goes to console and file
        >>> logger.debug("Detailed info")  # Only goes to file
    
    Note:
        - ERROR: Critical failures that stop execution (stderr + file)
        - WARN: Non-critical issues (stdout + file, unless silent)
        - INFO: Progress updates, successful operations (stdout + file, unless silent)
        - DEBUG: Detailed execution information (file only)
    """
    # Create logs directory
    log_dir = Path(__file__).parent.parent / "logs"
    log_dir.mkdir(exist_ok=True)
    
    # Generate timestamped filename (Windows-safe: no colons)
    timestamp = datetime.now().strftime("%Y-%m-%dT%H-%M-%S")
    log_file = log_dir / f"generator-{timestamp}.log"
    
    # File handler (DEBUG+, with timestamps)
    file_handler = logging.FileHandler(log_file, encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(
        logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
    )
    
    handlers = [file_handler]
    
    # Console handlers (no timestamps)
    console_format = logging.Formatter("%(name)s - %(levelname)s - %(message)s")
    
    if not silent:
        # INFO and WARNING to stdout
        stdout_handler = logging.StreamHandler(sys.stdout)
        stdout_handler.setLevel(logging.INFO)
        stdout_handler.addFilter(lambda record: record.levelno < logging.ERROR)
        stdout_handler.setFormatter(console_format)
        handlers.append(stdout_handler)
    
    # WARNING and ERROR to stderr (always, even in silent mode)
    stderr_handler = logging.StreamHandler(sys.stderr)
    stderr_handler.setLevel(logging.WARNING)
    stderr_handler.setFormatter(console_format)
    handlers.append(stderr_handler)
    
    # Configure root logger
    logging.basicConfig(
        level=logging.DEBUG,  # Root at DEBUG so file handler gets everything
        handlers=handlers,
        force=True  # Override any existing configuration
    )
    
    # Set level for our package loggers
    package_logger = logging.getLogger("scripts.docgen_v2")
    package_logger.setLevel(logging.DEBUG)
    
    # Log the file location (unless silent)
    if not silent:
        logger = logging.getLogger(__name__)
        logger.info(f"Logging to: {log_file}")
    
    return log_file


def get_logger(name: str) -> logging.Logger:
    """
    Get a logger instance for a module.
    
    Args:
        name: Logger name (typically __name__ from the calling module)
    
    Returns:
        logging.Logger: Configured logger instance
    
    Example:
        >>> logger = get_logger(__name__)
        >>> logger.info("Processing resource: aws_s3_bucket")  # Console + file
        >>> logger.debug("Detailed parsing info")  # File only
        >>> logger.error("Failed to parse resource")  # stderr + file
    """
    return logging.getLogger(name)
