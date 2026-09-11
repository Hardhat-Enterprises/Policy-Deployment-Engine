package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure dry-run egress policies are not destructively deleted.",
        "remedies": ["Use deletion_policy = \"ABANDON\" so Terraform does not remove the underlying dry-run egress policy during destroy operations."]
    },
    {
        "condition": "deletion_policy must prevent destructive deletion",
        "attribute_path": ["deletion_policy"],
        "values": ["ABANDON"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
