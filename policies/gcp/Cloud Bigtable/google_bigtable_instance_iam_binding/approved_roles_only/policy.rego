package terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_binding.approved_roles_only
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_binding.vars
conditions := [
	[
		{
			"situation_description": "Bigtable instance IAM binding uses a role outside the approved least-privilege set for data-plane access.",
			"remedies": [
				"Grant only `roles/bigtable.reader`, `roles/bigtable.user`, or `roles/bigtable.viewer` unless a documented exception requires a custom role.",
				"Avoid broad project roles on the instance binding; scope administrative work through separate controls.",
			],
		},
		{
			"condition":      "Role must be one of the approved Bigtable instance roles.",
			"attribute_path": ["role"],
			"values": [
				"roles/bigtable.reader",
				"roles/bigtable.user",
				"roles/bigtable.viewer",
			],
			"policy_type": "whitelist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
