package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_vpc_network_uri

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is linked to an unapproved VPC network",
		"remedies": ["Link the spoke only to an approved VPC network"],
	},
	{
		"condition": "The linked VPC network must be an approved network",
		"attribute_path": ["linked_vpc_network", 0, "uri"],
		"values": ["projects/approved-network-project/global/networks/approved-network"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
