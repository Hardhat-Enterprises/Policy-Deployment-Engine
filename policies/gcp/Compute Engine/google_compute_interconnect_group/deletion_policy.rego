package terraform.gcp.security.compute_engine.google_compute_interconnect_group.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_interconnect_group.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Interconnect group is using ABANDON and can leave critical network connectivity outside Terraform security management.",
			"remedies": [
				"Set deletion_policy to DELETE or PREVENT so the connection is removed safely or protected from accidental deletion.",
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
