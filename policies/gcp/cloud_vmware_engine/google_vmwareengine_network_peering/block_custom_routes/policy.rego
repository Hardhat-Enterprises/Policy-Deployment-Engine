package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_peering.block_custom_routes

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_network_peering.vars

conditions := [[
	{
		"situation_description": "Custom routes with public ip should be blocked",
		"remedies": ["Set public ip to false for custom routes"],
	},
	{
		"condition": "c1 Custom routes with public ip is blocked",
		"attribute_path": ["import_custom_routes_with_public_ip"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
