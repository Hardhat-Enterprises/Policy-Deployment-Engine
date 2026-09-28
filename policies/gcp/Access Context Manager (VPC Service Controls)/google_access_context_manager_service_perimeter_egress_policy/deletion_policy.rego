package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure service perimeter egress policies are protected from destructive deletion.",
        "remedies": ["Set deletion_policy to 'PREVENT' to reduce the risk of accidental removal of enforced egress controls."]
    },
    {
        "condition": "deletion_policy is set to PREVENT",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
