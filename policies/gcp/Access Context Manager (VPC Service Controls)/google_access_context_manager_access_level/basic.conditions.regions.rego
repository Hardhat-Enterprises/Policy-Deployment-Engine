package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_regions

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Access level request origin region is outside the approved country list.",
            "remedies": [
                "Set basic.conditions.regions to an approved ISO 3166-1 alpha-2 country code such as 'AU'.",
                "Use approved countries to support access governance and regional access control requirements."
            ]
        },
        {
            "condition": "Access level regions must only include approved country codes.",
            "attribute_path": ["basic", 0, "conditions", 0, "regions"],
            "values": ["AU"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details