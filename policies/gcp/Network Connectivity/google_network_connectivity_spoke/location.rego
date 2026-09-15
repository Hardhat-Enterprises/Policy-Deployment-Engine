package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.location

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is deployed in an unapproved location",
		"remedies": ["Deploy the spoke in a location included in the approved location list"],
	},
	{
		"condition": "The spoke must be deployed in an approved location",
		"attribute_path": ["location"],
		# Example approved locations; configure this list for your organization.
		"values": ["global", "us-central1"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
