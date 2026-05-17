package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.required_access_levels

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "A list of required access levels.",
		"remedies": ["Update required_access_levels to match authorized base levels."],
	},
	{
		"condition": "required_access_levels must be authorized",
		"attribute_path": ["required_access_levels"],
		"values": ["accessPolicies/123456789/accessLevels/base_level"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
