package terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.deletion_policy

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_spoke.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Center spoke is not protected against deletion",
		"remedies": ["Set deletion_policy to PREVENT"],
	},
	{
		"condition": "The spoke deletion policy must prevent resource destruction",
		"attribute_path": ["deletion_policy"],
		"values": ["PREVENT"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
