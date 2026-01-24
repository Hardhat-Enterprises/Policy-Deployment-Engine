package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.no_public_access

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Listing IAM Member must not grant public access to anyone on the internet (allUsers).",
			"remedies": [
				"Remove 'allUsers' from IAM member.",
				"Grant access only to approved identities such as users, groups, or service accounts.",
			],
		},
		{
			"condition": "Disallow allUsers in member",
			"attribute_path": ["member"],
			"values": ["allUsers"],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Do not grant high privilege roles to allAuthenticatedUsers on Listing IAM Member.",
			"remedies": [
				"Replace 'allAuthenticatedUsers' with specific principals (user/group/serviceAccount).",
				"If broad access is required, use least-privilege roles only.",
			],
		},
		{
			"condition": "Apply this check only when member is allAuthenticatedUsers",
			"attribute_path": ["member"],
			"values": ["allAuthenticatedUsers"],
			"policy_type": "whitelist",
		},
		{
			"condition": "Disallow high privilege roles for allAuthenticatedUsers",
			"attribute_path": ["role"],
			"values": [
				"roles/owner",
				"roles/editor",
				"roles/resourcemanager.projectIamAdmin",
				"roles/iam.securityAdmin",
			],
			"policy_type": "blacklist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
