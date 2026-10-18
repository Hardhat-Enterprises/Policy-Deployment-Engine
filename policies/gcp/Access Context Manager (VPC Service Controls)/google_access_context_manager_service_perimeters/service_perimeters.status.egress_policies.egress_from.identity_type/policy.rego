package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_status_egress_policies_egress_from_identity_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Enforced egress rules must not allow every identity type.",
        "remedies": ["Use a narrower identity type instead of ANY_IDENTITY."]
    },
    {
        "condition": "Enforced egress rules must not allow every identity type.",
        "attribute_path": ["service_perimeters", 0, "status", 0, "egress_policies", 0, "egress_from", 0, "identity_type"],
        "values": ["ANY_IDENTITY"],
        "policy_type": "Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
