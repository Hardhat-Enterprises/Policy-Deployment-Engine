package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_required_access_levels

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "A list of required access levels.",
		"remedies": ["Configure required_access_levels using valid access levels defined within the applicable Access Context Manager policy."],
	},
	{
		"condition": "required_access_levels must be authorized",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "required_access_levels"],
		"values": ["accessPolicies/*/accessLevels/*"],
		"policy_type": "element pattern whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


