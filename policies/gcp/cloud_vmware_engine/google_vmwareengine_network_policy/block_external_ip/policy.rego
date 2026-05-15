package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_policy.block_external_ip

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_policy.vars

conditions := [[
	{
		"situation_description": "External IP address is blocked",
		"remedies": ["External IPs should not be allocated"],
	},
	{
		"condition": "c1 External IPs are blocked",
		"attribute_path": ["external_ip", 0, "enabled"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details