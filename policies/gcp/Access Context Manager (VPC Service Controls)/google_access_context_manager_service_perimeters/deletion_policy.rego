package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeters.vars

conditions := [[
    {
        "situation_description": "Service perimeter destruction must be prevented.",
        "remedies": ["Set deletion_policy to PREVENT."]
    },
    {
        "condition": "Service perimeter destruction must be prevented.",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "Whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
