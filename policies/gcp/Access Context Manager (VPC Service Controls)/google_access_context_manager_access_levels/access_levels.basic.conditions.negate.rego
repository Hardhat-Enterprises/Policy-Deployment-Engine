package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_negate

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Whether to negate the Condition.",
		"remedies": ["Update negate to false."],
	},
	{
		"condition": "negate is false",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "negate"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
