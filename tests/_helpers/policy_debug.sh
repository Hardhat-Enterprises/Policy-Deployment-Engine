#!/bin/bash
# Policy Debug Tool
# Shows full policy output for debugging and validation

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

SUCCESS=0
ERRORS=0

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

test_policy() {
    local name="$1"
    local input="$2"
    local query="$3"
    
    echo ""
    echo "Testing: $name"
    echo "========================================"
    
    # Check if input file exists
    if [[ ! -f "$input" ]]; then
        echo "❌ ERROR: Input file not found"
        echo "   Path: $input"
        ((ERRORS++))
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
    
    # Check for errors
    if [[ $exit_code -ne 0 ]]; then
        echo "❌ ERROR: Policy evaluation failed"
        echo "$output"
        ((ERRORS++))
        return
    fi
    
    # Parse and format the JSON output
    if echo "$output" | jq -e . >/dev/null 2>&1; then
        local header
        local situations
        
        # Extract header (first element)
        header=$(echo "$output" | jq -r '.[0] // empty')
        
        if [[ -z "$header" ]]; then
            echo "❌ ERROR: Unexpected output format"
            echo "$output"
            ((ERRORS++))
            return
        fi
        
        echo "$header"
        
        # Check if there are violations (array length > 1)
        local violations_count
        violations_count=$(echo "$output" | jq 'length - 1')
        
        if [[ $violations_count -eq 0 ]]; then
            echo "Policy executed: All resources compliant"
            ((SUCCESS++))
        else
            echo "Policy executed: Found $violations_count violation(s)"
            ((SUCCESS++))
            echo ""
            
            # Format each situation
            echo "$output" | jq -r '
                .[] | 
                select(type == "array") | 
                to_entries | 
                map(
                    if .key == 0 then
                        "   " + .value
                    else
                        "   " + .value
                    end
                ) | 
                join("\n")
            '
        fi
    else
        # Handle non-JSON output (like "undefined")
        if [[ "$output" == "undefined" ]]; then
            echo "❌ ERROR: Query returned undefined (likely wrong query path)"
            ((ERRORS++))
        else
            echo "Output: $output"
            ((SUCCESS++))
        fi
    fi
    
    echo ""
}

echo "Policy Debug Output"
echo "======================================"

ACM_OS_TYPE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level/basic.conditions.device_policy.os_constraints.os_type"
APIHUB_ENCRYPTION="./policies/gcp/API Hub/google_apihub_api_hub_instance/config.encryption_type"
BACKUP_LOG_RETENTION="./policies/gcp/Backup and DR Service/google_backup_dr_backup_plan/log_retention_days"
APIGEE_CONTROL_PLANE_KEY="./policies/gcp/Apigee/google_apigee_organization/control_plane_encryption_key_name"
INGRESS_POLICY_RESOURCE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_ingress_policy/resource"

test_policy "Blacklist" \
    "$(plan_of "$ACM_OS_TYPE")" \
    "$(package_of "$ACM_OS_TYPE").message"

test_policy "Whitelist" \
    "$(plan_of "$APIHUB_ENCRYPTION")" \
    "$(package_of "$APIHUB_ENCRYPTION").message"

test_policy "Range" \
    "$(plan_of "$BACKUP_LOG_RETENTION")" \
    "$(package_of "$BACKUP_LOG_RETENTION").message"

test_policy "Pattern Blacklist" \
    "$(plan_of "$APIGEE_CONTROL_PLANE_KEY")" \
    "$(package_of "$APIGEE_CONTROL_PLANE_KEY").message"

test_policy "Pattern Whitelist" \
    "$(plan_of "$INGRESS_POLICY_RESOURCE")" \
    "$(package_of "$INGRESS_POLICY_RESOURCE").message"

echo ""
echo "======================================"
echo "Summary"
echo "======================================"
echo "✅ Successful: $SUCCESS"
echo "❌ Errors: $ERRORS"
echo "======================================"

exit $ERRORS
