package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.region

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport is deployed in an unapproved region",
		"remedies": ["Deploy the Transport only in an approved region"],
	},
	{
		"condition": "The Transport region must be approved",
		"attribute_path": ["region"],
		"values": ["us-east4"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
