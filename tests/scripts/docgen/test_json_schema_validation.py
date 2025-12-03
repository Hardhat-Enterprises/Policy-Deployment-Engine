"""
Tests for JSON schema validation of resource documentation files.

These tests ensure that all resource JSON templates conform to the expected schema
and maintain consistency across providers (AWS, Azure, GCP).
"""

import json
import pytest
from pathlib import Path
from jsonschema import validate, ValidationError


# Path setup
REPO_ROOT = Path(__file__).parent.parent.parent.parent
SCHEMA_PATH = REPO_ROOT / "scripts" / "docgen" / "data" / "resource_schema.json"
DOCS_DIR = REPO_ROOT / "docs"


@pytest.fixture
def resource_schema():
    """Load the JSON schema for resource templates."""
    with open(SCHEMA_PATH, 'r') as f:
        return json.load(f)


@pytest.fixture
def all_resource_json_files():
    """Find all resource JSON files across all providers."""
    providers = ["aws", "azure", "gcp"]
    json_files = []
    
    for provider in providers:
        provider_dir = DOCS_DIR / provider
        if provider_dir.exists():
            # Find all .json files in resource_json directories
            json_files.extend(provider_dir.rglob("resource_json/*.json"))
    
    return json_files


def test_schema_file_exists():
    """Test that the resource schema file exists."""
    assert SCHEMA_PATH.exists(), f"Schema file not found at {SCHEMA_PATH}"


def test_schema_is_valid_json(resource_schema):
    """Test that the schema itself is valid JSON."""
    assert resource_schema is not None
    assert isinstance(resource_schema, dict)
    assert "$schema" in resource_schema
    assert "title" in resource_schema


def test_schema_has_required_definitions(resource_schema):
    """Test that schema has all required top-level properties."""
    assert "properties" in resource_schema
    assert "resource_name" in resource_schema["properties"]
    assert "subcategory" in resource_schema["properties"]
    assert "arguments" in resource_schema["properties"]
    assert "$defs" in resource_schema
    assert "argument" in resource_schema["$defs"]


class TestResourceJSONValidation:
    """Test suite for validating individual resource JSON files."""
    
    def test_all_json_files_validate_against_schema(self, resource_schema, all_resource_json_files):
        """Test that all resource JSON files validate against the schema."""
        if not all_resource_json_files:
            pytest.skip("No resource JSON files found")
        
        errors = []
        
        for json_file in all_resource_json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                # Validate against schema
                validate(instance=data, schema=resource_schema)
                
            except ValidationError as e:
                errors.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "error": str(e.message),
                    "path": list(e.absolute_path)
                })
            except json.JSONDecodeError as e:
                errors.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "error": f"Invalid JSON: {e}",
                    "path": []
                })
        
        if errors:
            error_report = "\n\n".join([
                f"File: {err['file']}\n  Path: {'.'.join(map(str, err['path']))}\n  Error: {err['error']}"
                for err in errors
            ])
            pytest.fail(
                f"\n\n{'='*80}\n"
                f"SCHEMA VALIDATION FAILURES ({len(errors)} files)\n"
                f"{'='*80}\n\n"
                f"{error_report}\n"
            )
    
    def test_all_descriptions_are_non_empty(self, all_resource_json_files):
        """Test that all argument descriptions are non-empty strings."""
        if not all_resource_json_files:
            pytest.skip("No resource JSON files found")
        
        errors = []
        
        def check_descriptions(args, path=""):
            """Recursively check all argument descriptions."""
            for arg_name, arg_data in args.items():
                current_path = f"{path}.{arg_name}" if path else arg_name
                
                # Check description
                if "description" not in arg_data:
                    errors.append({
                        "path": current_path,
                        "error": "Missing 'description' field"
                    })
                elif not arg_data["description"] or not arg_data["description"].strip():
                    errors.append({
                        "path": current_path,
                        "error": "Empty or whitespace-only description"
                    })
                
                # Recurse into nested arguments
                if "arguments" in arg_data:
                    check_descriptions(arg_data["arguments"], current_path)
        
        files_with_issues = []
        
        for json_file in all_resource_json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                errors = []
                if "arguments" in data:
                    check_descriptions(data["arguments"])
                
                if errors:
                    files_with_issues.append({
                        "file": str(json_file.relative_to(REPO_ROOT)),
                        "errors": errors
                    })
                    
            except Exception as e:
                files_with_issues.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "errors": [{"path": "N/A", "error": f"Failed to parse: {e}"}]
                })
        
        if files_with_issues:
            error_report = "\n\n".join([
                f"File: {issue['file']}\n" + "\n".join([
                    f"  - {err['path']}: {err['error']}" for err in issue['errors']
                ])
                for issue in files_with_issues
            ])
            pytest.fail(
                f"\n\n{'='*80}\n"
                f"EMPTY DESCRIPTION FAILURES ({len(files_with_issues)} files)\n"
                f"{'='*80}\n\n"
                f"{error_report}\n"
            )
    
    def test_required_field_present(self, all_resource_json_files):
        """Test that all arguments have a 'required' field."""
        if not all_resource_json_files:
            pytest.skip("No resource JSON files found")
        
        errors = []
        
        def check_required_field(args, path=""):
            """Recursively check for 'required' field."""
            for arg_name, arg_data in args.items():
                current_path = f"{path}.{arg_name}" if path else arg_name
                
                if "required" not in arg_data:
                    errors.append({
                        "path": current_path,
                        "error": "Missing 'required' field"
                    })
                
                # Recurse into nested arguments
                if "arguments" in arg_data:
                    check_required_field(arg_data["arguments"], current_path)
        
        files_with_issues = []
        
        for json_file in all_resource_json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                errors = []
                if "arguments" in data:
                    check_required_field(data["arguments"])
                
                if errors:
                    files_with_issues.append({
                        "file": str(json_file.relative_to(REPO_ROOT)),
                        "errors": errors
                    })
                    
            except Exception as e:
                files_with_issues.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "errors": [{"path": "N/A", "error": f"Failed to parse: {e}"}]
                })
        
        if files_with_issues:
            error_report = "\n\n".join([
                f"File: {issue['file']}\n" + "\n".join([
                    f"  - {err['path']}: {err['error']}" for err in issue['errors']
                ])
                for issue in files_with_issues
            ])
            pytest.fail(
                f"\n\n{'='*80}\n"
                f"MISSING 'required' FIELD ({len(files_with_issues)} files)\n"
                f"{'='*80}\n\n"
                f"{error_report}\n"
            )


class TestCrossProviderConsistency:
    """Test suite for ensuring consistency across providers (AWS, Azure, GCP)."""
    
    def test_all_providers_use_same_field_structure(self, all_resource_json_files):
        """Test that all providers use consistent field structures."""
        if not all_resource_json_files:
            pytest.skip("No resource JSON files found")
        
        # Define expected fields at each level
        EXPECTED_TOP_LEVEL_FIELDS = {"resource_name", "subcategory", "arguments"}
        EXPECTED_ARGUMENT_FIELDS = {
            "description",
            "required",
            # Optional but should be present for consistency:
            "deprecated",
            "parent",
            "security_impact",
            "rationale",
            "compliant",
            "non_compliant"
        }
        
        def check_argument_fields(args, path=""):
            """Check that arguments have consistent field structures."""
            issues = []
            for arg_name, arg_data in args.items():
                current_path = f"{path}.{arg_name}" if path else arg_name
                
                # Check for unexpected fields
                actual_fields = set(arg_data.keys())
                # Remove 'arguments' from check as it's for nested blocks
                check_fields = actual_fields - {"arguments"}
                
                # Find fields that are in arg but not expected
                unexpected = check_fields - EXPECTED_ARGUMENT_FIELDS
                if unexpected:
                    issues.append({
                        "path": current_path,
                        "issue": f"Unexpected fields: {unexpected}"
                    })
                
                # Recurse into nested
                if "arguments" in arg_data:
                    issues.extend(check_argument_fields(arg_data["arguments"], current_path))
            
            return issues
        
        files_with_issues = []
        
        for json_file in all_resource_json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                issues = []
                
                # Check top-level fields
                top_fields = set(data.keys())
                if top_fields != EXPECTED_TOP_LEVEL_FIELDS:
                    missing = EXPECTED_TOP_LEVEL_FIELDS - top_fields
                    extra = top_fields - EXPECTED_TOP_LEVEL_FIELDS
                    if missing:
                        issues.append({"path": "<root>", "issue": f"Missing fields: {missing}"})
                    if extra:
                        issues.append({"path": "<root>", "issue": f"Extra fields: {extra}"})
                
                # Check argument field consistency
                if "arguments" in data:
                    issues.extend(check_argument_fields(data["arguments"]))
                
                if issues:
                    files_with_issues.append({
                        "file": str(json_file.relative_to(REPO_ROOT)),
                        "provider": json_file.parts[-4],  # aws/azure/gcp
                        "issues": issues
                    })
                    
            except Exception as e:
                files_with_issues.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "provider": "unknown",
                    "issues": [{"path": "N/A", "issue": f"Failed to parse: {e}"}]
                })
        
        if files_with_issues:
            # Group by provider
            by_provider = {}
            for item in files_with_issues:
                prov = item["provider"]
                if prov not in by_provider:
                    by_provider[prov] = []
                by_provider[prov].append(item)
            
            error_report = ""
            for provider, items in sorted(by_provider.items()):
                error_report += f"\n{'='*80}\n{provider.upper()} ({len(items)} files)\n{'='*80}\n"
                for item in items[:5]:  # Limit to first 5 per provider for readability
                    error_report += f"\nFile: {item['file']}\n"
                    for issue in item['issues'][:3]:  # Limit issues per file
                        error_report += f"  - {issue['path']}: {issue['issue']}\n"
                if len(items) > 5:
                    error_report += f"\n... and {len(items) - 5} more files\n"
            
            pytest.fail(
                f"\n\n{'='*80}\n"
                f"FIELD CONSISTENCY ISSUES ({len(files_with_issues)} files across providers)\n"
                f"{error_report}\n"
            )
    
    def test_parent_field_correctly_set_for_nested_arguments(self, all_resource_json_files):
        """Test that nested arguments have correct parent field set."""
        if not all_resource_json_files:
            pytest.skip("No resource JSON files found")
        
        def check_parent_fields(args, expected_parent=None, path=""):
            """Recursively check parent field correctness."""
            issues = []
            for arg_name, arg_data in args.items():
                current_path = f"{path}.{arg_name}" if path else arg_name
                
                # Check parent field
                if "parent" in arg_data:
                    actual_parent = arg_data["parent"]
                    if actual_parent != expected_parent:
                        issues.append({
                            "path": current_path,
                            "issue": f"parent='{actual_parent}' but should be '{expected_parent}'"
                        })
                else:
                    # Parent field should be present (even if null for top-level)
                    issues.append({
                        "path": current_path,
                        "issue": "Missing 'parent' field"
                    })
                
                # Recurse - nested args should have current arg as parent
                if "arguments" in arg_data:
                    issues.extend(
                        check_parent_fields(
                            arg_data["arguments"],
                            expected_parent=arg_name,
                            path=current_path
                        )
                    )
            
            return issues
        
        files_with_issues = []
        
        for json_file in all_resource_json_files:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                
                issues = []
                if "arguments" in data:
                    # Top-level arguments should have parent=null
                    issues = check_parent_fields(data["arguments"], expected_parent=None)
                
                if issues:
                    files_with_issues.append({
                        "file": str(json_file.relative_to(REPO_ROOT)),
                        "issues": issues
                    })
                    
            except Exception as e:
                files_with_issues.append({
                    "file": str(json_file.relative_to(REPO_ROOT)),
                    "issues": [{"path": "N/A", "issue": f"Failed to parse: {e}"}]
                })
        
        if files_with_issues:
            error_report = "\n\n".join([
                f"File: {issue['file']}\n" + "\n".join([
                    f"  - {err['path']}: {err['issue']}" for err in issue['issues'][:5]
                ])
                for issue in files_with_issues[:10]  # Limit to first 10 files
            ])
            if len(files_with_issues) > 10:
                error_report += f"\n\n... and {len(files_with_issues) - 10} more files"
            
            pytest.fail(
                f"\n\n{'='*80}\n"
                f"PARENT FIELD ISSUES ({len(files_with_issues)} files)\n"
                f"{'='*80}\n\n"
                f"{error_report}\n"
            )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
