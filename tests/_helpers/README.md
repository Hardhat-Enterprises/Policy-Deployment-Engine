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
| `shared_test.rego` | 26 | Shared utilities (get_resource_attribute, format paths, every-element path lookup, wildcard matching, etc.) |
| `helpers_test.rego` | 35 | Dispatcher and summary orchestration |
| `blacklist_test.rego` | 10 | Blacklist policy (forbidden values) |
| `whitelist_test.rego` | 11 | Whitelist policy (required values) |
| `range_test.rego` | 8 | Range policy (numeric bounds, simplified) |
| `pattern_blacklist_test.rego` | 11 | Pattern blacklist (glob matching forbidden) |
| `pattern_whitelist_test.rego` | 11 | Pattern whitelist (glob matching required) |
| `element_blacklist_test.rego` | 8 | Element blacklist (array elements with substrings) |
| `element_pattern_whitelist_test.rego` | 13 | Element pattern whitelist (array elements must match a shape) |
| `map_key_blacklist_test.rego` | 13 | Map key blacklist (prohibited map keys) |
| `map_key_blacklist_integration_test.rego` | 14 | Map key blacklist (dispatcher integration) |
| `element_required_test.rego` | 15 | Element required (list must contain every value, in every element) |
| `element_required_integration_test.rego` | 14 | Element required (dispatcher integration, reality check on the http_route plan) |
| `map_key_pattern_whitelist_test.rego` | 13 | Map key pattern whitelist (every map key must match a shape) |
| `map_key_pattern_whitelist_integration_test.rego` | 7 | Map key pattern whitelist (dispatcher integration) |
| `presence_test.rego` | 15 | Presence (attribute or block set or unset, in every element) |
| `presence_integration_test.rego` | 9 | Presence and per-rule checks (dispatcher integration) |
| `content_security_test.rego` | 6 | Content security (static-analysis findings at or above a severity threshold) |

**Total:** 239 tests covering all 12 helper policies

## Test Structure

Test files combine unit tests, integration checks, and reality checks against real
Terraform fixtures. Exact per-file counts are in the table above.

## Test Scripts

### unit_test_helpers.sh
Runs all 17 test suites, with fixtures where a suite uses them. Use for comprehensive validation.

### smoke_test_helpers.sh
Fast integration tests (one policy per type, each against its committed plan). Use for quick feedback during development.

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
| `gcp_storage_bucket_plan` | `google_storage_bucket` | blacklist, whitelist, range tests | self-contained capture (`retention_period` fixture pair) |
| `gcp_project_plan` | `google_project` | pattern blacklist/whitelist tests | self-contained capture (`project_id` fixture pair) |
| `gcp_access_level_plan` | `google_access_context_manager_access_level` | shared tests (deep nesting) | self-contained capture (`device_policy` fixture pair) |
| `gcp_http_route_plan` | `google_network_services_http_route` | element required integration (every-element reality check) | `policies/gcp/Network Services/google_network_services_http_route/rules.action.redirect.https_redirect/` |

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

A fixture is a committed plan (the `<sha>.json` beside a policy's fixtures) wrapped in
its unique key. To refresh one from its source policy:

```bash
# 1. Make sure the source policy's committed plan is current
python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"

# 2. Wrap that plan in the fixture's unique key
jq '{<fixture_name>_plan: .}' "policies/gcp/<Service>/<resource>/<argument>/<sha>.json" \
  > tests/_helpers/fixtures/<fixture_name>/plan.json
```

**Example:**

```bash
# HTTP Route
python3 scripts/auto_test/auto_test.py "gcp/Network Services/google_network_services_http_route"
jq '{gcp_http_route_plan: .}' \
  "policies/gcp/Network Services/google_network_services_http_route/rules.action.redirect.https_redirect/"<sha>.json \
  > tests/_helpers/fixtures/gcp_http_route/plan.json
```

### Creating New Fixtures

Follow this pattern for new fixtures:

```bash
# 1. Create fixture directory (name becomes data path prefix)
mkdir tests/_helpers/fixtures/gcp_compute_instance

# 2. Wrap the source policy's committed plan with a unique key matching
#    the directory name + _plan
jq '{gcp_compute_instance_plan: .}' "policies/gcp/<Service>/google_compute_instance/<argument>/<sha>.json" \
  > tests/_helpers/fixtures/gcp_compute_instance/plan.json

# 3. Access in tests as data.gcp_compute_instance_plan
```

**Key requirements:**
- Directory name must match wrapper key prefix (e.g., `gcp_compute_instance/` → `gcp_compute_instance_plan`)
- Always use `jq` to wrap the plan (prevents namespace conflicts)
- Source plans are the committed `<sha>.json` files under `policies/gcp/`

## Adding New Tests

1. Create `<helper_name>_test.rego` in `tests/_helpers/`
2. Write unit tests plus a reality check against a real Terraform fixture
3. Use fixtures for reality checks: `data.<fixture_name>_plan`
4. Update `unit_test_helpers.sh` to include new test file
5. Run tests to verify: `./tests/_helpers/unit_test_helpers.sh`
