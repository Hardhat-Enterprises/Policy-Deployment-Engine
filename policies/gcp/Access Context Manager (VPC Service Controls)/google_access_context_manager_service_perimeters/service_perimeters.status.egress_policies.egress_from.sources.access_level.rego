package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_status_egress_policies_egress_from_sources_access_level

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Enforced egress source access levels must not allow a wildcard source.",
        "remedies": ["Reference an explicit Access Context Manager access level."]
    },
    {
        "condition": "Enforced egress source access levels must not allow a wildcard source.",
        "attribute_path": ["service_perimeters", 0, "status", 0, "egress_policies", 0, "egress_from", 0, "sources", 0, "access_level"],
        "values": ["*"],
        "policy_type": "Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
