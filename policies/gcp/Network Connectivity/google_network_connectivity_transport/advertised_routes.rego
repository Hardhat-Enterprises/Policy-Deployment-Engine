package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.advertised_routes

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport advertises an unapproved route range",
		"remedies": [
			"Restrict advertised routes to approved IP CIDR ranges",
			"Do not advertise overly broad routes such as 0.0.0.0/0 unless explicitly approved",
		],
	},
	{
		"condition": "Advertised routes must contain only approved IP ranges",
		"attribute_path": ["advertised_routes"],
		"values": ["10.0.0.0/8"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
