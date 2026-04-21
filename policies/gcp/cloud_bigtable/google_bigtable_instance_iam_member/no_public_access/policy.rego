package terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_member.no_public_access

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance_iam_member.vars

conditions := [
	[
		{
			"situation_description": "Bigtable instance IAM bindings must not allow public principals (allUsers or allAuthenticatedUsers), which would expose instance data plane access broadly.",
			"remedies": [
				"Remove IAM members `allUsers` and `allAuthenticatedUsers`; grant access only to explicit users, groups, or service accounts.",
				"Prefer least-privilege roles such as `roles/bigtable.user` scoped to trusted principals.",
			],
		},
		{
			"condition":      "member must not be a public principal",
			"attribute_path": ["member"],
			"values":         ["allUsers", "allAuthenticatedUsers"],
			"policy_type":    "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
