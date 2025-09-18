package terraform.gcp.security.gdce.node_pool.basic_checks

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars # Shared vars

conditions := [
	# 1. Node location validation
	[
		{
			"situation_description": "Node pool is in an invalid location.",
			"remedies": ["Use approved edge locations: australia-southeast1-edge-customer-a, australia-southeast1-edge-customer-b"],
		},
		{
			"condition": "Node location must be in approved list",
			"attribute_path": ["node_location"],
			"values": ["australia-southeast1-edge-customer-a", "australia-southeast1-edge-customer-b"],
			"policy_type": "whitelist",
		},
	],

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
	"message": message,
	"details": details,
}
