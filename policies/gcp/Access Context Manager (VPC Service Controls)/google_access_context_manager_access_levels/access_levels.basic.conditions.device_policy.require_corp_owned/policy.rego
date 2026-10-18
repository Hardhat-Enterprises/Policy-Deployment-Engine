package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_device_policy_require_corp_owned

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Whether the device needs to be corp owned.",
		"remedies": ["Update require_corp_owned to true."],
	},
	{
		"condition": "require_corp_owned is true",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "device_policy", 0, "require_corp_owned"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
