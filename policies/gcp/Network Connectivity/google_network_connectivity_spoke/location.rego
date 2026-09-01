package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.location

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is deployed in an unapproved location",
		"remedies": ["Deploy the spoke only in an approved location"],
	},
	{
		"condition": "The spoke must be deployed in an approved location",
		"attribute_path": ["location"],
		"values": ["global"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
