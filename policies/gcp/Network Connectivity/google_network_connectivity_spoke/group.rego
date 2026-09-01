package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.group

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is associated with an unapproved spoke group",
		"remedies": ["Associate the spoke only with an approved Network Connectivity Center group"],
	},
	{
		"condition": "The spoke group must be an approved Network Connectivity Center group",
		"attribute_path": ["group"],
		"values": ["projects/approved-network-project/locations/global/hubs/approved-hub/groups/default"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
