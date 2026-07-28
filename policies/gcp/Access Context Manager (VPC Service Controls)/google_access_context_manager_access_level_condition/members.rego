package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.members

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "An allowed list of members.",
		"remedies": ["Update members to include authorized users only."],
	},
	{
		"condition": "members must be authorized",
		"attribute_path": ["members"],
		"values": ["user:admin@example.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
