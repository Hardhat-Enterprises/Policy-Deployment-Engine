package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.australia_zone_required

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars

conditions := [
	[
		{
			"situation_description": "Cloud Bigtable clusters must run in an approved Australian zone so data stays in the intended region and meets locality requirements.",
			"remedies": [
				"Set the cluster `zone` to `australia-southeast1-a` (or expand the policy whitelist only after formal approval of additional zones).",
				"Migrate workloads by creating a compliant instance in the approved zone and cutting over before destroying non-compliant infrastructure.",
			],
		},
		{
			"condition":        "Require cluster zone to be an approved Australian zone",
			"attribute_path": ["cluster", "zone"],
			"values":        ["australia-southeast1-a"],
			"policy_type":   "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
