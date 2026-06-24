package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_device_policy_os_constraints_minimum_version

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The minimum allowed OS version constraint.",
		"remedies": ["Update minimum_version to 10.0.0."],
	},
	{
		"condition": "minimum_version is 10.0.0",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "device_policy", 0, "os_constraints", 0, "minimum_version"],
		"values": ["10.0.0"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
