package terraform.gcp.security.Container_Azure.google_container_azure_cluster.control_plane.replica_placements.azure_availability_zone

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
	{
		"situation_description": "If the control_plane.replica_placements.azure_availability_zone attribute is not set to an approved availability zone, the Container Azure Cluster may be deployed in an unapproved Azure availability zone.",
		"remedies": ["Set the 'control_plane.replica_placements.azure_availability_zone' attribute to an approved availability zone such as '1'."],
	},
	{
		"condition": "Check if the Azure availability zone is an approved availability zone.",
		"attribute_path": ["control_plane", 0, "replica_placements", 0, "azure_availability_zone"],
		"values": ["1"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details