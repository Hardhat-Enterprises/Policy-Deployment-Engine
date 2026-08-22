package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_from_source_restriction

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure service perimeter egress policies enforce configured source restrictions.",
        "remedies": ["Set egress_from.source_restriction to 'SOURCE_RESTRICTION_ENABLED' when source conditions are used."]
    },
    {
        "condition": "egress_from.source_restriction is enabled",
        "attribute_path": ["egress_from", 0, "source_restriction"],
        "values": ["SOURCE_RESTRICTION_ENABLED"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
