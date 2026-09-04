package terraform.gcp.security.compute_engine.google_compute_resize_request.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_resize_request.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Resize request is using ABANDON as its deletion policy.",
			"remedies": [
				"Set deletion_policy to DELETE or PREVENT so the resize request stays under Terraform management.",
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
