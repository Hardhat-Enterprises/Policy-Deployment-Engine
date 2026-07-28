package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars
conditions := [
	[
		{
			"situation_description": "Cloud Bigtable instances must have deletion protection enabled so instances cannot be destroyed accidentally or by unauthorized changes.",
			"remedies": [
				"Set `deletion_protection = true` on the `google_bigtable_instance` resource.",
				"Apply the change through your normal Terraform workflow and verify the instance remains protected before removing protection only during a controlled deletion.",
			],
		},
		{
			"condition":        "Require deletion_protection to be true",
			"attribute_path": ["deletion_protection"],
			"values":         [true],
			"policy_type":    "whitelist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
