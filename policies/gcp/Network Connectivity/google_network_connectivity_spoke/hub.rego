package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.hub

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is attached to an unapproved hub",
		"remedies": ["Attach the spoke only to an approved Network Connectivity Center hub"],
	},
	{
		"condition": "The hub must be an approved Network Connectivity Center hub",
		"attribute_path": ["hub"],
		"values": ["projects/approved-network-project/locations/global/hubs/approved-hub"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
