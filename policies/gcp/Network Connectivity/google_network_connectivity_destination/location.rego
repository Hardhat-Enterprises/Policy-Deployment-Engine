package terraform.gcp.security.network_connectivity.google_network_connectivity_destination.location

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_destination.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Destination is deployed in an unapproved location",
		"remedies": ["Deploy the Destination only in an approved location"],
	},
	{
		"condition": "The Destination must be deployed in an approved location",
		"attribute_path": ["location"],
		"values": ["us-central1"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
