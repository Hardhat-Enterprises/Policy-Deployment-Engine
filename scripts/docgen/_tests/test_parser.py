"""
Unit tests for parser.py functions.

Tests specific parsing functions to ensure correct behavior,
particularly for edge cases like escaped underscores in resource names.

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
from scripts.docgen.lib.parser import check_resource_deprecation, extract_resource_name


class TestExtractResourceName:
    """Tests for extract_resource_name function."""
    
    def test_aws_resource_normal(self):
        """Test AWS resource with normal underscores."""
        content = "# Resource: aws_s3_bucket\nManages an S3 bucket."
        result = extract_resource_name(content)
        assert result == "aws_s3_bucket"
    
    def test_aws_data_source_normal(self):
        """Test AWS data source with normal underscores."""
        content = "# Data Source: aws_ami\nGet information about an AMI."
        result = extract_resource_name(content)
        assert result == "aws_ami"
    
    def test_gcp_resource_normal(self):
        """Test GCP resource with normal underscores."""
        content = "# google_storage_bucket\nManages a GCS bucket."
        result = extract_resource_name(content)
        assert result == "google_storage_bucket"
    
    def test_gcp_resource_escaped_underscores(self):
        """Test GCP resource with escaped underscores."""
        content = r"# google\_biglake\_catalog" + "\nManages a BigLake catalog."
        result = extract_resource_name(content)
        assert result == "google_biglake_catalog"
    
    def test_azure_resource_normal(self):
        """Test Azure resource with normal underscores."""
        content = "# azurerm_storage_account\nManages a storage account."
        result = extract_resource_name(content)
        assert result == "azurerm_storage_account"
    
    def test_azure_resource_escaped_underscores(self):
        """Test Azure resource with escaped underscores."""
        content = r"# azurerm\_storage\_account" + "\nManages a storage account."
        result = extract_resource_name(content)
        assert result == "azurerm_storage_account"
    
    def test_aws_resource_escaped_underscores(self):
        """Test AWS resource pattern 1 with escaped underscores."""
        content = r"# Resource: aws\_s3\_bucket" + "\nManages an S3 bucket."
        result = extract_resource_name(content)
        assert result == "aws_s3_bucket"
    
    def test_gcp_resource_multiple_escaped_underscores(self):
        """Test GCP resource with multiple escaped underscores."""
        content = r"# google\_compute\_instance\_group\_manager" + "\nManages instance group."
        result = extract_resource_name(content)
        assert result == "google_compute_instance_group_manager"
    
    def test_no_match_returns_none(self):
        """Test that no match returns None."""
        content = "# Some Random Title\nNo resource here."
        result = extract_resource_name(content)
        assert result is None
    
    def test_mixed_escaped_and_normal_underscores(self):
        """Test resource with mixed escaped and normal underscores."""
        # This tests that the unescape works correctly
        content = r"# google\_big_query\_dataset" + "\nManages BigQuery dataset."
        result = extract_resource_name(content)
        assert result == "google_big_query_dataset"


class TestCheckResourceDeprecation:
    """Tests for check_resource_deprecation function."""

    def test_azure_callout_deprecation(self):
        content = (
            "---\nsubcategory: X\n---\n\n"
            "!> **Note:** This resource has been deprecated in favour of foo\n"
            "and will be removed.\n\n# Example\n"
        )
        is_dep, msg = check_resource_deprecation(content)
        assert is_dep is True
        assert "deprecated" in msg.lower()

    def test_gcp_line_deprecation(self):
        content = "# google_x\n\nThis resource has been deprecated; use google_y.\n"
        is_dep, msg = check_resource_deprecation(content)
        assert is_dep is True
        assert msg.startswith("This resource has been deprecated")

    def test_not_deprecated(self):
        content = "# google_x\n\nManages a thing.\n\n* `name` - (Required) name\n"
        assert check_resource_deprecation(content) == (False, None)

    def test_deprecation_below_head_window_is_ignored(self):
        # A "deprecated" mention far down (e.g. in an example) must not trigger.
        content = "# google_x\n\nManages a thing.\n" + ("\n" * 60) + \
            "This resource has been deprecated\n"
        assert check_resource_deprecation(content) == (False, None)
