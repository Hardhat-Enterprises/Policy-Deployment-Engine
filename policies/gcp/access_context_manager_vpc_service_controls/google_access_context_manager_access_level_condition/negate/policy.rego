package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.negate

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Whether to negate the Condition.",
		"remedies": ["Update negate to false."],
	},
	{
		"condition": "negate is false",
		"attribute_path": ["negate"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
