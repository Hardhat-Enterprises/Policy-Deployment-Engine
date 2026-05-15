package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_policy.allowed_location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_policy.vars

conditions := [[
	{
		"situation_description": "Network policy is within australia region",
		"remedies": ["Use Australian regions"],
	},
	{
		"condition": "c1 location is either australia-southeast1 or australia-southeast2",
		"attribute_path": ["location"],
		"values": ["australia-southeast1", "australia-southeast2"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
