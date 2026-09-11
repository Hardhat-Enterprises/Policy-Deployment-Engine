package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_status_egress_policies_egress_from_source_restriction

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Enforced egress source restrictions must be enabled.",
        "remedies": ["Set source_restriction to SOURCE_RESTRICTION_ENABLED."]
    },
    {
        "condition": "Enforced egress source restrictions must be enabled.",
        "attribute_path": ["service_perimeters", 0, "status", 0, "egress_policies", 0, "egress_from", 0, "source_restriction"],
        "values": ["SOURCE_RESTRICTION_ENABLED"],
        "policy_type": "Whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
