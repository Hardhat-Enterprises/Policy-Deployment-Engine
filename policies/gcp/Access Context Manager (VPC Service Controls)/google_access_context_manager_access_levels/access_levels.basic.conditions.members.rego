package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_members

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "An allowed list of members.",
		"remedies": ["Update members to include authorized users only."],
	},
	{
		"condition": "members must be authorized",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "members"],
		"values": ["user:admin@example.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
