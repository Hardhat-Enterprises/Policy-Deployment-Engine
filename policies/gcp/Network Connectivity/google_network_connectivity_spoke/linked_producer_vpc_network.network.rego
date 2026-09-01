package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_producer_vpc_network_network

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is linked to an unapproved producer VPC network",
		"remedies": ["Link the spoke only to an approved Service Consumer VPC network"],
	},
	{
		"condition": "The producer VPC network must reference an approved network",
		"attribute_path": ["linked_producer_vpc_network", 0, "network"],
		"values": ["projects/approved-network-project/global/networks/approved-consumer-vpc"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
