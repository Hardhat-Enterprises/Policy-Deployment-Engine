package terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.region

import data.terraform.gcp.security.compute_engine.google_compute_region_ssl_policy.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Regional SSL policy is outside the approved Australian regions.",
			"remedies": [
				"Set region to australia-southeast1 or australia-southeast2.",
			],
		},
		{
			"condition": "region must be an approved Australian region.",
			"attribute_path": ["region"],
			"values": [
				"australia-southeast1",
				"australia-southeast2",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
