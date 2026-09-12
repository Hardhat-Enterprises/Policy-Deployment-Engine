package terraform.gcp.security.compute_engine.google_compute_interconnect_group.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_interconnect_group.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Interconnect group is using ABANDON and can leave critical network connectivity outside Terraform security management.",
			"remedies": [
				"Set deletion_policy to DELETE to remove the group through Terraform, or PREVENT to block accidental or malicious deletion.",
			],
		},
		{
			"condition": "deletion_policy must be set to DELETE or PREVENT.",
			"attribute_path": ["deletion_policy"],
			"values": ["DELETE", "PREVENT"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
