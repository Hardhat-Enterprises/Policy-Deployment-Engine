package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_producer_vpc_network_peering

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke uses an unapproved producer VPC peering relationship",
		"remedies": ["Use only an approved VPC peering relationship for the producer VPC spoke"],
	},
	{
		"condition": "The producer VPC peering relationship must be approved",
		"attribute_path": ["linked_producer_vpc_network", 0, "peering"],
		"values": ["approved-vpc-peering"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
