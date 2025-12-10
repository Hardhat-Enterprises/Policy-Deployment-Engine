# Helper Policy Tests

Unit tests for policy helper functions in `policies/_helpers/`.

## Quick Start

```bash
# Run all helper tests
./tests/_helpers/unit_test_helpers.sh

# Quick integration check
./tests/_helpers/smoke_test_helpers.sh

# Debug policy output
./tests/_helpers/policy_debug.sh

# Review violation messages
./tests/_helpers/check_ux.sh
```

## Test Files

| File | Tests | Coverage |
|------|-------|----------|
| `shared_test.rego` | 12 | Shared utilities (get_resource_attribute, format paths, etc.) |
| `blacklist_test.rego` | 10 | Blacklist policy (forbidden values) |
| `whitelist_test.rego` | 10 | Whitelist policy (required values) |
| `range_test.rego` | 8 | Range policy (numeric bounds, simplified) |
| `pattern_blacklist_test.rego` | 8 | Pattern blacklist (glob matching forbidden) |
| `pattern_whitelist_test.rego` | 8 | Pattern whitelist (glob matching required) |
| `element_blacklist_test.rego` | 8 | Element blacklist (array elements with substrings) |

**Total:** 64 tests covering all 7 helper policies

## Test Structure

Each test file follows an 8-test pattern:
- **Unit tests (6):** Test individual helper functions with boundary cases
- **Integration test (1):** Realistic mocks with multiple resources
- **Reality check (1):** Uses real Terraform fixtures

## Test Scripts

### unit_test_helpers.sh
Runs all 7 test suites with fixtures. Use for comprehensive validation.

### smoke_test_helpers.sh
Fast integration tests (5 policies at policy level). Use for quick feedback during development.

### policy_debug.sh
Shows full policy output with `--format pretty`. Use when debugging failures.

### check_ux.sh
Displays complete violation objects. Use to review user-facing error messages before merging.

## Fixtures

Real Terraform plans wrapped in unique keys to avoid OPA namespace conflicts.

### Why Wrapper Structure?

OPA loads all JSON files recursively and merges them into a single `data` namespace. When multiple files have identical top-level keys (like `format_version`, `terraform_version`), OPA throws merge conflicts.

**Solution:** Wrap each Terraform plan in a unique outer key matching the directory name + `_plan` suffix.

```json
{
  "gcp_storage_bucket_plan": {
    "format_version": "1.2",
    "terraform_version": "1.12.2",
    "planned_values": { ... },
    "resource_changes": [ ... ]
  }
}
```

### Available Fixtures

| Fixture | Resource | Used By | Source |
|---------|----------|---------|--------|
| `gcp_storage_bucket_plan` | `google_storage_bucket` | blacklist, whitelist, range tests | `inputs/gcp/cloud_storage/google_storage_bucket/retention_period/` |
| `gcp_project_plan` | `google_project` | pattern blacklist/whitelist tests | `inputs/gcp/cloud_platform_service/google_project/project_id/` |
| `gcp_access_level_plan` | `google_access_context_manager_access_level` | shared tests (deep nesting) | `inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_access_level/device_policy/` |

**Note:** `gcp_access_level_plan` has 5-level deep nesting, ideal for testing nested attribute extraction.

### Using Fixtures

```rego
test_with_fixture if {
    plan := data.gcp_storage_bucket_plan  # Wrapper key becomes data path
    resource := plan.planned_values.root_module.resources[0]
    # ... test logic
}
```

### Regenerating Fixtures

When helper functions change or test cases need updates:

```bash
# 1. Navigate to Terraform configuration
cd inputs/gcp/<service>/<resource>/<scenario>

# 2. Generate plan (if not already exists)
terraform init
terraform plan -out=plan.tfplan

# 3. Export to JSON and wrap in unique namespace
terraform show -json plan.tfplan > plan.json
jq '{<fixture_name>_plan: .}' plan.json > ../../../../tests/_helpers/fixtures/<fixture_name>/plan.json

# 4. Cleanup
rm plan.json plan.tfplan
```

**Examples:**

```bash
# Storage Bucket
cd inputs/gcp/cloud_storage/google_storage_bucket/retention_period
terraform show -json plan.tfplan > plan.json
jq '{gcp_storage_bucket_plan: .}' plan.json > ../../../../tests/_helpers/fixtures/gcp_storage_bucket/plan.json
rm plan.json

# Project
cd inputs/gcp/cloud_platform_service/google_project/project_id
terraform show -json plan.tfplan > plan.json
jq '{gcp_project_plan: .}' plan.json > ../../../../tests/_helpers/fixtures/gcp_project/plan.json
rm plan.json

# Access Level
cd inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_access_level/device_policy
terraform show -json plan.tfplan > plan.json
jq '{gcp_access_level_plan: .}' plan.json > ../../../../tests/_helpers/fixtures/gcp_access_level/plan.json
rm plan.json
```

### Creating New Fixtures

Follow this pattern for new fixtures:

```bash
# 1. Create fixture directory (name becomes data path prefix)
mkdir tests/_helpers/fixtures/gcp_compute_instance

# 2. Navigate to relevant Terraform configuration
cd inputs/gcp/<service>/google_compute_instance/<scenario>

# 3. Generate Terraform plan
terraform init
terraform plan -out=plan.tfplan
terraform show -json plan.tfplan > plan.json

# 4. Wrap with unique key matching directory name + _plan
jq '{gcp_compute_instance_plan: .}' plan.json > ../../../../tests/_helpers/fixtures/gcp_compute_instance/plan.json

# 5. Cleanup
rm plan.json plan.tfplan

# 6. Access in tests as data.gcp_compute_instance_plan
```

**Key requirements:**
- Directory name must match wrapper key prefix (e.g., `gcp_compute_instance/` → `gcp_compute_instance_plan`)
- Always use `jq` to wrap the plan (prevents namespace conflicts)
- Source Terraform configs from `inputs/gcp/` directory

## Adding New Tests

1. Create `<helper_name>_test.rego` in `tests/_helpers/`
2. Follow 8-test pattern (6 unit + 1 integration + 1 reality check)
3. Use fixtures for reality checks: `data.<fixture_name>_plan`
4. Update `unit_test_helpers.sh` to include new test file
5. Run tests to verify: `./tests/_helpers/unit_test_helpers.sh`
