package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.service_perimeters_spec_egress_policies_egress_to_operations_service_name

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Dry-run egress operations must not allow every Google API service.",
        "remedies": ["Replace wildcard service access with an explicit approved destination service."]
    },
    {
        "condition": "Dry-run egress operations must not allow every Google API service.",
        "attribute_path": ["service_perimeters", 0, "spec", 0, "egress_policies", 0, "egress_to", 0, "operations", 0, "service_name"],
        "values": ["*"],
        "policy_type": "Blacklist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
