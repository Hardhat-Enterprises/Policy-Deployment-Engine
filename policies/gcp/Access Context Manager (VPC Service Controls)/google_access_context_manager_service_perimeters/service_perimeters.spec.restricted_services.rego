package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_spec_restricted_services

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Dry-run restricted services must not contain wildcard service access.",
        "remedies": ["Replace wildcard entries with explicit Google API service names."]
    },
    {
        "condition": "Dry-run restricted services must not contain wildcard service access.",
        "attribute_path": ["service_perimeters", 0, "spec", 0, "restricted_services"],
        "values": ["*"],
        "policy_type": "Element Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
