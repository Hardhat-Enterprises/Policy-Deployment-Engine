package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.remote_account_id

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport is associated with an unapproved remote cloud account",
		"remedies": ["Use only an approved remote cloud service provider account ID"],
	},
	{
		"condition": "The remote account ID must be approved",
		"attribute_path": ["remote_account_id"],
		"values": ["123"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
