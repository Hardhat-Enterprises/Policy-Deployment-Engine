package terraform.gcp.security.compute_engine.google_compute_network_endpoint_group.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_network_endpoint_group.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Network endpoint group is using ABANDON as its deletion policy.",
			"remedies": [
				"Set deletion_policy to DELETE or PREVENT so the network endpoint group stays under Terraform management.",
			],
		},
		{
			"condition": "deletion_policy must not be set to ABANDON.",
			"attribute_path": ["deletion_policy"],
			"values": ["ABANDON"],
			"policy_type": "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
