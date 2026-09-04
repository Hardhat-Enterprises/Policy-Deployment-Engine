package terraform.gcp.security.compute_engine.google_compute_network_endpoint_group.zone

import data.terraform.gcp.security.compute_engine.google_compute_network_endpoint_group.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Network endpoint group is outside the approved Australian zones.",
			"remedies": [
				"Set zone to an approved zone in australia-southeast1 or australia-southeast2.",
			],
		},
		{
			"condition": "zone must be an approved Australian zone.",
			"attribute_path": ["zone"],
			"values": [
				"australia-southeast1-a",
				"australia-southeast1-b",
				"australia-southeast1-c",
				"australia-southeast2-a",
				"australia-southeast2-b",
				"australia-southeast2-c",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
