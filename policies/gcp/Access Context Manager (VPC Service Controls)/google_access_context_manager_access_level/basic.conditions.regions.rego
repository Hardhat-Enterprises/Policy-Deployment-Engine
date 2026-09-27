package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_regions

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Ensure Access Context Manager access level conditions restrict requests to approved geographic regions.",
                "remedies": ["Update regions to include only approved ISO 3166-1 alpha-2 country codes such as AU."],
        },
        {
                "condition": "regions contains only approved geographic regions",
                "attribute_path": ["basic", 0, "conditions", 0, "regions"],
                "values": ["AU"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
