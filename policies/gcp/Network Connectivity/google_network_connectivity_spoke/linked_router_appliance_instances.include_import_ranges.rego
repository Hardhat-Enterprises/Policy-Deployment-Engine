package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_router_appliance_instances_include_import_ranges

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center Router Appliance spoke imports an unapproved route range",
		"remedies": [
			"Restrict Router Appliance import ranges to approved IPv4 CIDR ranges",
			"Do not use ALL_IPV4_RANGES unless explicitly approved",
		],
	},
	{
		"condition": "Router Appliance import ranges must be approved",
		"attribute_path": ["linked_router_appliance_instances", 0, "include_import_ranges"],
		"values": ["10.0.0.0/8"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
