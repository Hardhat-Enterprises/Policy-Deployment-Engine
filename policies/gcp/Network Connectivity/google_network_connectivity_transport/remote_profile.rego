package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.remote_profile

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport is connected to an unapproved remote transport profile",
		"remedies": ["Connect the Transport only to an approved remote transport profile"],
	},
	{
		"condition": "The remote transport profile must be approved",
		"attribute_path": ["remote_profile"],
		"values": ["https://networkconnectivity.googleapis.com/v1beta/approved-network-project/locations/us-east4/remoteTransportProfiles/aws-us-east-1"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
