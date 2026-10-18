#!/bin/bash
# Smoke tests for helper refactoring
# Tests one policy per type with minimal output for quick verification

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

echo "Helper Refactor Smoke Tests"
echo "================================"
echo "Testing against committed Terraform plans for:"
echo "  • google_access_context_manager_access_level.basic.conditions.device_policy.os_constraints.os_type"
echo "  • google_apihub_api_hub_instance.config.encryption_type"
echo "  • google_backup_dr_backup_plan.log_retention_days"
echo "  • google_apigee_organization.control_plane_encryption_key_name"
echo "  • google_access_context_manager_ingress_policy.resource"
echo ""

FAILED=0
PASSED=0

# A policy's committed plan (the one <sha>.json in its argument directory) and its
# package, so the cases below survive a provider bump renaming the plan.
plan_of() {
    local plan
    plan=$(ls "$1" 2>/dev/null | grep -E '^[0-9a-f]{64}\.json$' | head -1)
    echo "$1/$plan"
}
package_of() {
    echo "data.$(awk 'NR == 1 {print $2}' "$1/policy.rego" 2>/dev/null)"
}

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

# One policy per type, each against its committed plan
# Format: run_test "name" "input" "query" expected_violations expected_resource_in_output

ACM_OS_TYPE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level/basic.conditions.device_policy.os_constraints.os_type"
APIHUB_ENCRYPTION="./policies/gcp/API Hub/google_apihub_api_hub_instance/config.encryption_type"
BACKUP_LOG_RETENTION="./policies/gcp/Backup and DR Service/google_backup_dr_backup_plan/log_retention_days"
APIGEE_CONTROL_PLANE_KEY="./policies/gcp/Apigee/google_apigee_organization/control_plane_encryption_key_name"
INGRESS_POLICY_RESOURCE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_ingress_policy/resource"

run_test "Blacklist" \
    "$(plan_of "$ACM_OS_TYPE")" \
    "$(package_of "$ACM_OS_TYPE").message" \
    1 \
    "non_compliant_os_type"

run_test "Whitelist" \
    "$(plan_of "$APIHUB_ENCRYPTION")" \
    "$(package_of "$APIHUB_ENCRYPTION").message" \
    1 \
    "non_compliant_example_1"

run_test "Range" \
    "$(plan_of "$BACKUP_LOG_RETENTION")" \
    "$(package_of "$BACKUP_LOG_RETENTION").message" \
    1 \
    "non_compliant_example_1"

run_test "Pattern Blacklist" \
    "$(plan_of "$APIGEE_CONTROL_PLANE_KEY")" \
    "$(package_of "$APIGEE_CONTROL_PLANE_KEY").message" \
    1 \
    "non_compliant_example_1"

run_test "Pattern Whitelist" \
    "$(plan_of "$INGRESS_POLICY_RESOURCE")" \
    "$(package_of "$INGRESS_POLICY_RESOURCE").message" \
    1 \
    "non_compliant_example_1"

echo ""
echo "================================"
echo "Results: $PASSED passed, $FAILED failed"

exit $FAILED
