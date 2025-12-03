"""
Tests for AWS document generator (v3.0 - Terraform CLI Schema-Based).

These tests validate the AWS documentation generator components:
- Schema transformation from Terraform JSON to Resource models
- Subcategory mapping from JSON file
- Data model validation with Pydantic
- End-to-end generation workflow

Note: Tests are designed to work without requiring Terraform CLI installation.
Mock data is used for unit tests. Integration tests may require Terraform.
"""

import json
import tempfile
import shutil
import pytest
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

# Import from docgen module (path set up in conftest.py)
from docgen.lib.schema_transformer import SchemaTransformer, SubcategoryMapper, TerraformAttribute
from docgen.lib.models import Statistics, Metadata, Resource, Argument
from docgen.lib.terraform_client import TerraformProviderSchema


@pytest.fixture
def temp_output_dir():
    """Create a temporary output directory for tests."""
    temp_dir = tempfile.mkdtemp(prefix="test_aws_docs_")
    yield temp_dir
    shutil.rmtree(temp_dir, ignore_errors=True)


@pytest.fixture
def schema_transformer():
    """Provide a SchemaTransformer instance for testing."""
    return SchemaTransformer()


@pytest.fixture
def mock_subcategory_mappings(tmp_path):
    """Create a temporary subcategory mapping file for testing."""
    mappings = {
        "aws_s3_bucket": "S3 (Simple Storage)",
        "aws_ec2_instance": "EC2 (Elastic Compute Cloud)",
        "aws_iam_role": "IAM (Identity & Access Management)",
        "aws_lambda_function": "Lambda",
        "aws_dynamodb_table": "DynamoDB"
    }
    mapping_file = tmp_path / "test_subcategories.json"
    mapping_file.write_text(json.dumps(mappings, indent=2))
    
    # Patch the SubcategoryMapper to use our test file
    original_file = SubcategoryMapper._mapping_file
    SubcategoryMapper._mapping_file = mapping_file
    SubcategoryMapper._cache = None  # Reset cache
    
    yield mapping_file
    
    # Restore original
    SubcategoryMapper._mapping_file = original_file
    SubcategoryMapper._cache = None


def test_transform_simple_attributes(schema_transformer, mock_subcategory_mappings):
    """Test transformation of simple required and optional attributes."""
    schema = {
        "block": {
            "attributes": {
                "bucket": {
                    "type": "string",
                    "description": "Name of the bucket",
                    "required": True,
                    "optional": False
                },
                "acl": {
                    "type": "string",
                    "description": "The canned ACL to apply",
                    "required": False,
                    "optional": True
                }
            }
        }
    }
    
    resource = schema_transformer.transform_resource("aws_s3_bucket", schema)
    
    assert resource.name == "s3_bucket"
    assert resource.subcategory == "S3 (Simple Storage)"
    assert "bucket" in resource.arguments
    assert resource.arguments["bucket"].required is True
    assert "Name of the bucket" in resource.arguments["bucket"].description
    assert resource.arguments["bucket"].deprecated is False
    
    assert "acl" in resource.arguments
    assert resource.arguments["acl"].required is False
    assert "The canned ACL to apply" in resource.arguments["acl"].description




def test_transform_deprecated_attributes(schema_transformer, mock_subcategory_mappings):
    """Test detection of deprecated attributes from schema."""
    schema = {
        "block": {
            "attributes": {
                "acl": {
                    "type": "string",
                    "description": "The canned ACL to apply",
                    "optional": True,
                    "deprecated": True
                }
            }
        }
    }
    
    resource = schema_transformer.transform_resource("aws_s3_bucket", schema)
    
    assert "acl" in resource.arguments
    assert resource.arguments["acl"].deprecated is True
    assert resource.arguments["acl"].required is False


def test_transform_nested_blocks(schema_transformer, mock_subcategory_mappings):
    """Test transformation of nested block structures."""
    schema = {
        "block": {
            "attributes": {
                "name": {
                    "type": "string",
                    "description": "Table name",
                    "required": True
                }
            },
            "block_types": {
                "attribute": {
                    "nesting_mode": "list",
                    "block": {
                        "attributes": {
                            "name": {
                                "type": "string",
                                "description": "Attribute name",
                                "required": True
                            },
                            "type": {
                                "type": "string",
                                "description": "Attribute type",
                                "required": True
                            }
                        }
                    }
                }
            }
        }
    }
    
    resource = schema_transformer.transform_resource("aws_dynamodb_table", schema)
    
    # Verify top-level attribute
    assert "name" in resource.arguments
    assert resource.arguments["name"].required is True
    
    # Verify nested block
    assert "attribute" in resource.arguments
    block_arg = resource.arguments["attribute"]
    assert block_arg.nested is not None
    assert isinstance(block_arg.nested, dict)
    assert len(block_arg.nested) == 2
    
    # Verify nested arguments
    assert "name" in block_arg.nested
    assert block_arg.nested["name"].parent == "attribute"
    assert block_arg.nested["name"].required is True
    
    assert "type" in block_arg.nested
    assert block_arg.nested["type"].parent == "attribute"
    assert block_arg.nested["type"].required is True


def test_subcategory_mapper_lookup(mock_subcategory_mappings):
    """Test subcategory mapper correctly loads and looks up mappings."""
    # Test successful lookup
    result = SubcategoryMapper.get_subcategory("aws_s3_bucket")
    assert result == "S3 (Simple Storage)"
    
    result = SubcategoryMapper.get_subcategory("aws_lambda_function")
    assert result == "Lambda"
    
    # Test missing mapping fails loud
    with pytest.raises(ValueError, match="No subcategory mapping for resource"):
        SubcategoryMapper.get_subcategory("aws_unknown_resource")


def test_resource_to_dict_preserves_structure():
    """Test Resource.to_dict() maintains correct JSON structure."""
    resource = Resource(
        name="s3_bucket",
        subcategory="S3 (Simple Storage)",
        arguments={
            "bucket": Argument(
                description="Bucket name",
                required=True,
                deprecated=False,
                parent=None,
                nested={}
            ),
            "cors_rule": Argument(
                description="CORS configuration",
                required=False,
                deprecated=False,
                parent=None,
                nested={
                    "allowed_methods": Argument(
                        description="Allowed methods",
                        required=True,
                        deprecated=False,
                        parent="cors_rule",
                        nested={}
                    )
                }
            )
        }
    )
    
    result = resource.to_dict()
    
    assert result["resource_name"] == "s3_bucket"
    assert result["subcategory"] == "S3 (Simple Storage)"
    assert "arguments" in result
    assert "bucket" in result["arguments"]
    assert result["arguments"]["bucket"]["required"] is True
    assert result["arguments"]["bucket"]["description"] == "Bucket name"
    
    # Verify nested structure
    assert "cors_rule" in result["arguments"]
    assert "arguments" in result["arguments"]["cors_rule"]
    assert "allowed_methods" in result["arguments"]["cors_rule"]["arguments"]
    assert result["arguments"]["cors_rule"]["arguments"]["allowed_methods"]["parent"] == "cors_rule"


def test_metadata_generation():
    """Test metadata generation with statistics."""
    from datetime import datetime, timezone
    
    stats = Statistics(
        total_resources=1563,
        total_services=240,
        deprecated_arguments=342,
        skipped_resources=0,
        skipped_list=[]
    )
    
    metadata = Metadata(
        provider_name="hashicorp/terraform-provider-aws",
        provider_version="v6.22.1",
        generation_date=datetime.now(timezone.utc),
        statistics=stats
    )
    
    result = metadata.to_dict()
    
    assert result["provider"]["name"] == "hashicorp/terraform-provider-aws"
    assert result["provider"]["version"] == "v6.22.1"
    assert result["generation"]["script_version"] == "3.0.0-terraform-cli"
    assert result["statistics"]["total_resources"] == 1563
    assert result["statistics"]["total_services"] == 240
    assert result["statistics"]["deprecated_arguments"] == 342


def test_terraform_attribute_validation():
    """Test TerraformAttribute Pydantic validation."""
    # Valid attribute
    attr = TerraformAttribute(
        type="string",
        description="Test description",
        required=True,
        optional=False,
        deprecated=False
    )
    assert attr.type == "string"
    assert attr.required is True
    
    # Attribute with list type
    attr_list = TerraformAttribute(
        type=["list", "string"],
        description="List of strings",
        optional=True
    )
    assert isinstance(attr_list.type, list)
    assert attr_list.optional is True


def test_argument_security_fields_preserved():
    """Test that security analysis fields are preserved in Argument model."""
    arg = Argument(
        description="Bucket name",
        required=True,
        deprecated=False,
        parent=None,
        nested={},
        security_impact="high",
        rationale="Public buckets create data exposure risk",
        compliant="Use random suffix",
        non_compliant="Hardcoded name"
    )
    
    # Convert to dict and verify security fields present
    result = arg.model_dump(exclude_none=True)
    
    assert result["security_impact"] == "high"
    assert result["rationale"] == "Public buckets create data exposure risk"
    assert result["compliant"] == "Use random suffix"
    assert result["non_compliant"] == "Hardcoded name"


@pytest.mark.integration
def test_schema_transformer_handles_complex_resource(schema_transformer, mock_subcategory_mappings):
    """Integration test: Transform a complex resource with multiple nesting levels."""
    # Simulate a complex DynamoDB table schema
    schema = {
        "block": {
            "attributes": {
                "name": {"type": "string", "required": True, "description": "Table name"},
                "billing_mode": {"type": "string", "optional": True, "description": "Billing mode"},
                "hash_key": {"type": "string", "required": True, "description": "Hash key attribute"}
            },
            "block_types": {
                "attribute": {
                    "nesting_mode": "set",
                    "block": {
                        "attributes": {
                            "name": {"type": "string", "required": True, "description": "Attribute name"},
                            "type": {"type": "string", "required": True, "description": "Attribute type"}
                        }
                    }
                },
                "global_secondary_index": {
                    "nesting_mode": "list",
                    "block": {
                        "attributes": {
                            "name": {"type": "string", "required": True, "description": "Index name"},
                            "hash_key": {"type": "string", "required": True, "description": "Hash key"}
                        },
                        "block_types": {
                            "projection": {
                                "nesting_mode": "single",
                                "block": {
                                    "attributes": {
                                        "projection_type": {"type": "string", "optional": True, "description": "Projection type"}
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    resource = schema_transformer.transform_resource("aws_dynamodb_table", schema)
    
    # Verify basic structure
    assert resource.name == "dynamodb_table"
    assert resource.subcategory == "DynamoDB"
    
    # Verify simple attributes
    assert "name" in resource.arguments
    assert "billing_mode" in resource.arguments
    assert "hash_key" in resource.arguments
    
    # Verify first-level nested block
    assert "attribute" in resource.arguments
    assert len(resource.arguments["attribute"].nested) == 2
    assert "name" in resource.arguments["attribute"].nested
    assert "type" in resource.arguments["attribute"].nested
    
    # Verify second-level nested block
    assert "global_secondary_index" in resource.arguments
    gsi = resource.arguments["global_secondary_index"]
    assert "name" in gsi.nested
    assert "hash_key" in gsi.nested
    
    # Verify third-level nested block
    assert "projection" in gsi.nested
    projection = gsi.nested["projection"]
    assert "projection_type" in projection.nested
    assert projection.nested["projection_type"].parent == "projection"
    
    # Verify resource can be serialized to JSON
    result = resource.to_dict()
    json_str = json.dumps(result, indent=2)
    assert len(json_str) > 0
    
    # Verify JSON can be parsed back
    parsed = json.loads(json_str)
    assert parsed["resource_name"] == "dynamodb_table"
    assert parsed["subcategory"] == "DynamoDB"


def test_invalid_schema_structure_fails_loud(schema_transformer, mock_subcategory_mappings):
    """Test that invalid schema structure raises clear errors."""
    # Missing 'block' key
    invalid_schema = {
        "attributes": {
            "name": {"type": "string"}
        }
    }
    
    with pytest.raises(ValueError, match="Invalid schema.*missing 'block' key"):
        schema_transformer.transform_resource("aws_s3_bucket", invalid_schema)


def test_missing_subcategory_fails_loud(schema_transformer):
    """Test that missing subcategory mapping fails with clear error."""
    schema = {
        "block": {
            "attributes": {
                "name": {"type": "string", "required": True}
            }
        }
    }
    
    # Reset cache to force file read
    SubcategoryMapper._cache = None
    
    with pytest.raises(ValueError, match="No subcategory mapping"):
        schema_transformer.transform_resource("aws_unknown_service_resource", schema)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])