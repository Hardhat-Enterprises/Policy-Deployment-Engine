package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.linked_router_appliance_instances_instances_virtual_machine

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke uses an unapproved Router Appliance virtual machine",
		"remedies": ["Use only an approved virtual machine as the Router Appliance instance"],
	},
	{
		"condition": "The Router Appliance virtual machine must be approved",
		"attribute_path": [
			"linked_router_appliance_instances",
			0,
			"instances",
			0,
			"virtual_machine",
		],
		"values": ["projects/approved-network-project/zones/us-central1-a/instances/approved-router-appliance"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
