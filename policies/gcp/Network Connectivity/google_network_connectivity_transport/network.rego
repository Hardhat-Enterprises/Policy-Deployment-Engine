package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.network

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport is connected to an unapproved network",
		"remedies": ["Connect the Transport only to an approved VPC network"],
	},
	{
		"condition": "The Transport network must be approved",
		"attribute_path": ["network"],
		"values": ["approved-network"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
