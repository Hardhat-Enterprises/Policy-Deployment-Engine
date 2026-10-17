package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_required_access_levels

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Configured prerequisite access levels must use valid Access Context Manager resource-name structure.",
                "remedies": ["Update each configured required_access_levels entry to use the documented accessPolicies/{policy_id}/accessLevels/{short_name} resource-name structure."],
        },
        {
                "condition": "required_access_levels must be authorized",
                "attribute_path": ["basic", 0, "conditions", 0, "required_access_levels"],
                "values": ["accessPolicies/*/accessLevels/*"],
                "policy_type": "element pattern whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

