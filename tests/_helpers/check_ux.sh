#!/bin/bash
# UX Message Review Tool
# Displays actual violation messages to verify they are clear and actionable

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

echo "🔍 UX Message Review"
echo "======================================"
echo ""

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

inspect_policy() {
    local name="$1"
    local input="$2"
    local query="$3"
    

    echo "Policy: $name"
    echo "======================================"
    echo ""
    
    # Get message and details fields
    message=$(opa eval \
        --data ./policies/_helpers \
        --data ./policies/gcp \
        --input "$input" \
        "${query}.message" \
        --format pretty 2>&1)
    
    details=$(opa eval \
        --data ./policies/_helpers \
        --data ./policies/gcp \
        --input "$input" \
        "${query}.details" \
        --format pretty 2>&1)
    
    if [ $? -eq 0 ]; then
        echo "MESSAGE:"
        echo "$message"
        echo ""
        echo "DETAILS:"
        echo "$details"
    else
        echo "❌ Error evaluating policy:"
        echo "$message"
    fi
    
    echo ""
    echo ""
}

# One policy per type, with its violations

ACM_OS_TYPE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_access_level/basic.conditions.device_policy.os_constraints.os_type"
APIHUB_ENCRYPTION="./policies/gcp/API Hub/google_apihub_api_hub_instance/config.encryption_type"
BACKUP_LOG_RETENTION="./policies/gcp/Backup and DR Service/google_backup_dr_backup_plan/log_retention_days"
APIGEE_CONTROL_PLANE_KEY="./policies/gcp/Apigee/google_apigee_organization/control_plane_encryption_key_name"
INGRESS_POLICY_RESOURCE="./policies/gcp/Access Context Manager (VPC Service Controls)/google_access_context_manager_ingress_policy/resource"

inspect_policy "Blacklist (Access Level OS Type)" \
    "$(plan_of "$ACM_OS_TYPE")" \
    "$(package_of "$ACM_OS_TYPE")"

inspect_policy "Whitelist (API Hub Encryption)" \
    "$(plan_of "$APIHUB_ENCRYPTION")" \
    "$(package_of "$APIHUB_ENCRYPTION")"

inspect_policy "Range (Backup Plan Log Retention)" \
    "$(plan_of "$BACKUP_LOG_RETENTION")" \
    "$(package_of "$BACKUP_LOG_RETENTION")"

inspect_policy "Pattern Blacklist (Apigee Control Plane Key)" \
    "$(plan_of "$APIGEE_CONTROL_PLANE_KEY")" \
    "$(package_of "$APIGEE_CONTROL_PLANE_KEY")"

inspect_policy "Pattern Whitelist (Ingress Policy Resource)" \
    "$(plan_of "$INGRESS_POLICY_RESOURCE")" \
    "$(package_of "$INGRESS_POLICY_RESOURCE")"

echo "======================================"
echo "✅ Inspection complete"
echo ""
echo "Use this to verify:"
echo "  - Violation messages are clear and actionable"
echo "  - Resource names are displayed correctly"
echo "  - Attribute paths are formatted properly"
echo "  - Blacklist/whitelist values are shown"
echo "  - Empty values show (EMPTY!) warning"
