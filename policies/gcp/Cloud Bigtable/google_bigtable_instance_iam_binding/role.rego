package terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_binding.vars

# Merged policy for `role` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
[
		{
			"situation_description": "Bigtable instance IAM binding grants an overly broad project or admin role on the instance.",
			"remedies": [
				"Remove `roles/owner`, `roles/editor`, and `roles/bigtable.admin` from instance bindings unless a break-glass process explicitly requires them.",
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
