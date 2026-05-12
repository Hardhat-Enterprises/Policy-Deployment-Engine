package terraform.gcp.security.cloud_bigtable.google_bigtable_table_iam_binding.no_owner_or_admin_roles
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_table_iam_binding.vars
conditions := [
	[
		{
			"situation_description": "Bigtable table IAM binding grants an overly broad project or admin role on the table.",
			"remedies": [
				"Remove `roles/owner`, `roles/editor`, and `roles/bigtable.admin` from table bindings unless a break-glass process explicitly requires them.",
				"If role allowlists are enforced elsewhere, this policy can be redundant; prefer explicit least-privilege bindings.",
			],
		},
		{
			"condition":      "Role must not be owner, editor, or Bigtable admin.",
			"attribute_path": ["role"],
			"values":         ["roles/owner", "roles/editor", "roles/bigtable.admin"],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
