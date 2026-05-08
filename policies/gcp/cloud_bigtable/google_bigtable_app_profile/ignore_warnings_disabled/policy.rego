package terraform.gcp.security.cloud_bigtable.google_bigtable_app_profile.ignore_warnings_disabled
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_app_profile.vars
conditions := [
	[
		{
			"situation_description": "Bigtable app profiles must not ignore warnings because it can bypass safeguards that surface risky configuration and operational changes.",
			"remedies": [
				"Set `ignore_warnings = false` on the `google_bigtable_app_profile` resource.",
				"Re-apply via your normal Terraform workflow and only override warnings during a documented, time-bound exception process.",
			],
		},
		{
			"condition":      "ignore_warnings must not be true",
			"attribute_path": ["ignore_warnings"],
			"values":         [true],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
