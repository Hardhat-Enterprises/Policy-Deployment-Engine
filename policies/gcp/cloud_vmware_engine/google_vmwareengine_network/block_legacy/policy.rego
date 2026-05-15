package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network.block_legacy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network.vars

conditions := [[
	{
		"situation_description": "Check if legacy network type is used",
		"remedies": ["Do not use legacy network as it is being phased out now, use standard instead"],
	},
	{
		"condition": "c1 Legacy network is not allowed",
		"attribute_path": ["type"],
		"values": ["LEGACY"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
