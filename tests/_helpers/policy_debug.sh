#!/bin/bash
# Policy Debug Tool
# Shows full policy output for debugging and validation

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

SUCCESS=0
ERRORS=0

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

test_policy "Blacklist & Element Blacklist" \
    "./inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_service_perimeter/status/plan.json" \
    "data.terraform.gcp.security.access_context_manager_vpc_service_controls.access_context_manager_service_perimeter.status.message"

test_policy "Whitelist" \
    "./inputs/gcp/api_hub/google_apihub_api_hub_instance/config_encryption_type/plan.json" \
    "data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_encryption_type.message"

test_policy "Range" \
    "./inputs/gcp/cloud_storage/google_storage_bucket/retention_period/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_bucket.retention_period.message"

test_policy "Pattern Blacklist" \
    "./inputs/gcp/cloud_storage/google_storage_default_object_acl/public_access_prevention/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_default_object_acl.public_access_prevention.message"

test_policy "Pattern Whitelist" \
    "./inputs/gcp/cloud_platform_service/google_project/project_id/plan.json" \
    "data.terraform.gcp.security.cloud_platform_service.google_project.project_id.message"

echo ""
echo "======================================"
echo "Summary"
echo "======================================"
echo "✅ Successful: $SUCCESS"
echo "❌ Errors: $ERRORS"
echo "======================================"

exit $ERRORS
