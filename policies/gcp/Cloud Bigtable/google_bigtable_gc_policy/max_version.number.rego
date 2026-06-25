package terraform.gcp.security.cloud_bigtable.google_bigtable_gc_policy.max_version_number
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_gc_policy.vars
conditions := [
	[
		{
			"situation_description": "When `max_version.number` is set on a Bigtable GC policy, the policy must not retain more than 5 versions of a cell.",
			"remedies": [
				"Set `max_version.number` to 5 or less on `google_bigtable_gc_policy`.",
			],
		},
		{
			"condition":      "max_version.number must be at most 5",
			"attribute_path": ["max_version", 0, "number"],
			"values":         [null, 5],
			"policy_type":    "range",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
