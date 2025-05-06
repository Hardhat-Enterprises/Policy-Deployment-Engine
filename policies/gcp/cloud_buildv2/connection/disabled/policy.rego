package terraform.gcp.security.cloud_buildv2.connection.disabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
	# Scenario 1: Check if the connection is disabled
	[
		{
		"situation_description": "GCB connection should not be disabled",
		"remedies": ["Set 'disabled' to false to enable the connection."]
		},
		{
		"condition": "Disabled attribute is not false",
		"attribute_path": ["disabled"],
		"values": [false],
		"policy_type": "whitelist",
		}
	]
]	
summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

details := summary.details
