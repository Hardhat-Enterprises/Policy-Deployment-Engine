package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.ip_subnetworks

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "A list of allowed IP subnetworks.",
		"remedies": ["Update ip_subnetworks to allowed CIDR blocks."],
	},
	{
		"condition": "ip_subnetworks must be restricted",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "ip_subnetworks"],
		"values": ["192.168.100.14/24"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
