package terraform.gcp.security.network_connectivity.google_network_connectivity_transport.provided_activation_key

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_transport.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Transport contains a directly provided activation key",
		"remedies": [
			"Remove the plaintext activation key from the Terraform resource",
			"Supply sensitive connection material through an approved secret-management process",
		],
	},
	{
		"condition": "The Transport must not contain a directly configured activation key",
		"attribute_path": ["provided_activation_key"],
		"values": [null],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
