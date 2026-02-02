#!/bin/bash
# Smoke tests for helper refactoring
# Tests all 6 policy types with minimal output for quick verification

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

echo "Helper Refactor Smoke Tests"
echo "================================"
echo "Testing against actual Terraform plans for:"
echo "  • access_context_manager_service_perimeter.status"
echo "  • google_apihub_api_hub_instance.config_encryption_type"
echo "  • google_storage_bucket.retention_period"
echo "  • google_storage_default_object_acl.public_access_prevention"
echo "  • google_project.project_id"
echo ""

FAILED=0
PASSED=0

run_test() {
    local name="$1"
    local input="$2"
    local query="$3"
    local expected_violations="$4"
    local expected_resource="$5"
    
    echo -n "Testing $name... "
    
    # Check if input file exists
    if [[ ! -f "$input" ]]; then
        echo "❌ FAIL (input file not found: $input)"
        ((FAILED++))
        return
    fi
    
    # Capture output and exit code
    local output
    local exit_code
    output=$(opa eval \
        --data ./policies/_helpers \
        --data ./policies/gcp \
        --input "$input" \
        "$query" \
        --format raw 2>&1)
    exit_code=$?
    
    # Check for OPA errors
    if [[ $exit_code -ne 0 ]]; then
        echo "❌ FAIL (policy error: $output)"
        ((FAILED++))
        return
    fi
    
    # Validate output is valid JSON
    if ! echo "$output" | jq -e . >/dev/null 2>&1; then
        echo "❌ FAIL (invalid JSON output)"
        ((FAILED++))
        return
    fi
    
    # Check expected violation count
    local violation_count
    violation_count=$(echo "$output" | jq 'length - 1')
    
    if [[ "$violation_count" != "$expected_violations" ]]; then
        echo "❌ FAIL (expected $expected_violations violations, found $violation_count)"
        ((FAILED++))
        return
    fi
    
    # If expecting violations, check for expected resource in output
    if [[ $expected_violations -gt 0 ]] && [[ -n "$expected_resource" ]]; then
        if ! echo "$output" | grep -q "$expected_resource"; then
            echo "❌ FAIL (expected resource '$expected_resource' not found in output)"
            ((FAILED++))
            return
        fi
    fi
    
    echo "✅ PASS"
    ((PASSED++))
}

# Test all 6 policy types
# Format: run_test "name" "input" "query" expected_violations expected_resource_in_output

run_test "Blacklist & Element Blacklist" \
    "./inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_service_perimeter/status/plan.json" \
    "data.terraform.gcp.security.access_context_manager_vpc_service_controls.access_context_manager_service_perimeter.status.message" \
    1 \
    "nc-null-restricted-services"

run_test "Whitelist" \
    "./inputs/gcp/api_hub/google_apihub_api_hub_instance/config_encryption_type/plan.json" \
    "data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_encryption_type.message" \
    0 \
    ""

run_test "Range" \
    "./inputs/gcp/cloud_storage/google_storage_bucket/retention_period/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_bucket.retention_period.message" \
    1 \
    "nc123"

run_test "Pattern Blacklist" \
    "./inputs/gcp/cloud_storage/google_storage_default_object_acl/public_access_prevention/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_default_object_acl.public_access_prevention.message" \
    1 \
    "nc123"

run_test "Pattern Whitelist" \
    "./inputs/gcp/cloud_platform_service/google_project/project_id/plan.json" \
    "data.terraform.gcp.security.cloud_platform_service.google_project.project_id.message" \
    1 \
    "nc123"

echo ""
echo "================================"
echo "Results: $PASSED passed, $FAILED failed"

exit $FAILED
