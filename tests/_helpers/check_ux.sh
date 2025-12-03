#!/bin/bash
# UX Message Review Tool
# Displays actual violation messages to verify they are clear and actionable

# Navigate to repository root
cd "$(git rev-parse --show-toplevel)" || exit 1

echo "🔍 UX Message Review"
echo "======================================"
echo ""

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

# Test all 6 policy types with their violations

inspect_policy "Blacklist & Element Blacklist (Access Context Manager)" \
    "./inputs/gcp/access_context_manager_vpc_service_controls/access_context_manager_service_perimeter/status/plan.json" \
    "data.terraform.gcp.security.access_context_manager_vpc_service_controls.access_context_manager_service_perimeter.status"

inspect_policy "Whitelist (API Hub Encryption)" \
    "./inputs/gcp/api_hub/google_apihub_api_hub_instance/config_encryption_type/plan.json" \
    "data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_encryption_type"

inspect_policy "Range (Storage Bucket Retention Period)" \
    "./inputs/gcp/cloud_storage/google_storage_bucket/retention_period/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_bucket.retention_period"

inspect_policy "Pattern Blacklist (Storage Default Object ACL)" \
    "./inputs/gcp/cloud_storage/google_storage_default_object_acl/public_access_prevention/plan.json" \
    "data.terraform.gcp.security.cloud_storage.google_storage_default_object_acl.public_access_prevention"

inspect_policy "Pattern Whitelist (Project ID)" \
    "./inputs/gcp/cloud_platform_service/google_project/project_id/plan.json" \
    "data.terraform.gcp.security.cloud_platform_service.google_project.project_id"

echo "======================================"
echo "✅ Inspection complete"
echo ""
echo "Use this to verify:"
echo "  - Violation messages are clear and actionable"
echo "  - Resource names are displayed correctly"
echo "  - Attribute paths are formatted properly"
echo "  - Blacklist/whitelist values are shown"
echo "  - Empty values show (EMPTY!) warning"
