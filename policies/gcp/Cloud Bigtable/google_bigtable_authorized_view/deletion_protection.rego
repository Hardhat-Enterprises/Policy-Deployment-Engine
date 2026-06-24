package terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.vars
conditions := [
	[
		{
			"situation_description": "Bigtable authorized views must use backend deletion protection (deletion_protection = PROTECTED) to reduce the risk of accidental or unauthorized removal of the view configuration.",
			"remedies": [
				"Set `deletion_protection = PROTECTED` on the `google_bigtable_authorized_view` resource.",
				"Only change to `UNPROTECTED` during a controlled maintenance window if a delete is truly required, then re-protect.",
			],
		},
		{
			"condition":      "Require deletion_protection to be PROTECTED",
			"attribute_path": ["deletion_protection"],
			"values":         ["PROTECTED"],
			"policy_type":    "whitelist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
