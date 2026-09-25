package terraform.gcp.security.network_connectivity.google_network_connectivity_regional_endpoint.deletion_policy

import data.terraform.gcp.security.network_connectivity.google_network_connectivity_regional_endpoint.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Network Connectivity Regional Endpoint is not protected against deletion",
		"remedies": ["Set deletion_policy to PREVENT"],
	},
	{
		"condition": "The Regional Endpoint deletion policy must prevent resource destruction",
		"attribute_path": ["deletion_policy"],
		"values": ["PREVENT"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
