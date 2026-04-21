package terraform.gcp.security.cloud_bigtable.google_bigtable_gc_policy.max_age_retention_limit

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_gc_policy.vars

conditions := [
	[
		{
			"situation_description": "When `max_age.days` is set on a Bigtable GC policy, retention must not exceed 90 days.",
			"remedies": [
				"Set `max_age.days` to 90 or less on `google_bigtable_gc_policy`.",
			],
		},
		{
			"condition":      "max_age.days must be at most 90",
			"attribute_path": ["max_age", 0, "days"],
			"values":         [null, 90],
			"policy_type":    "range",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
