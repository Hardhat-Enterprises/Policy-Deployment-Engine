package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_status_egress_policies_egress_to_roles

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Enforced egress rules must not grant broad primitive IAM roles.",
        "remedies": ["Replace broad owner/editor roles with least-privilege roles."]
    },
    {
        "condition": "Enforced egress rules must not grant broad primitive IAM roles.",
        "attribute_path": ["service_perimeters", 0, "status", 0, "egress_policies", 0, "egress_to", 0, "roles"],
        "values": ["roles/owner", "roles/editor"],
        "policy_type": "Element Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
