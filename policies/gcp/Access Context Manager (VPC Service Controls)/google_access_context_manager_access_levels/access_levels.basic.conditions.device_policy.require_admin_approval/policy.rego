package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_device_policy_require_admin_approval

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Whether administrator approval is required.",
		"remedies": ["Update require_admin_approval to true."],
	},
	{
		"condition": "require_admin_approval is true",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "device_policy", 0, "require_admin_approval"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
