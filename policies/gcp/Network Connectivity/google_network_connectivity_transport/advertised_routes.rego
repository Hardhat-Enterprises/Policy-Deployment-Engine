package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.advertised_routes

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport advertises an unrestricted default route",
		"remedies": [
			"Replace unrestricted default routes with appropriately scoped IP prefixes",
			"Do not advertise 0.0.0.0/0 or ::/0 unless the policy is explicitly customized",
		],
	},
	{
		"condition": "Advertised routes must not contain unrestricted IPv4 or IPv6 default routes",
		"attribute_path": ["advertised_routes"],
		"values": ["0.0.0.0/0", "::/0"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
