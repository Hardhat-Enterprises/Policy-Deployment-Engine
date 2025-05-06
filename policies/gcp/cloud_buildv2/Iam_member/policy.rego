package terraform.gcp.security.cloud_buildv2.connection.iam_member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
	[
		{
			"situation_description": "IAM members must be from approved service accounts or users",
			"remedies": ["Use only allowed member emails such as 'user:dev@example.com' or 'serviceAccount:ci-bot@project.iam.gserviceaccount.com'"],
		},
		{
			"condition": "IAM member is unapproved",
			"attribute_path": ["member"],
			"values": [
				"user:dev@example.com",
				"serviceAccount:ci-bot@project.iam.gserviceaccount.com",
			],
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "IAM member must not be an anonymous or allUsers account",
			"remedies": ["Avoid using 'allUsers' or 'allAuthenticatedUsers'"],
		},
		{
			"condition": "IAM member is public",
			"attribute_path": ["member"],
			"values": ["allUsers", "allAuthenticatedUsers"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "IAM members must not have overly permissive roles",
			"remedies": ["Avoid using overly permissive roles like 'roles/owner'"],
		},
		{
			"condition": "IAM member has overly permissive role",
			"attribute_path": ["role"],
			"values": ["roles/owner"],
			"policy_type": "blacklist",
		},
	],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message

details := summary.details
