package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.egress_from_sources_resource

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_egress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure service perimeter egress policies only allow approved source project resources.",
        "remedies": ["Replace unapproved egress_from.sources.resource values with approved project resources such as 'projects/123456789'."]
    },
    {
        "condition": "egress_from.sources.resource only contains approved source projects",
        "attribute_path": ["egress_from", 0, "sources", 0, "resource"],
        "values": ["projects/123456789"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
