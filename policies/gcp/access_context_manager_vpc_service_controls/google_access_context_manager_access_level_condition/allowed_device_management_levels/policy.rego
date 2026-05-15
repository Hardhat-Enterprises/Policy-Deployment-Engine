package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.allowed_device_management_levels

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level_condition.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "A list of allowed device management levels.",
		"remedies": ["Update allowed_device_management_levels to ['COMPLETE']."],
	},
	{
		"condition": "allowed_device_management_levels requires COMPLETE",
		"attribute_path": ["device_policy", 0, "allowed_device_management_levels"],
		"values": ["COMPLETE"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
