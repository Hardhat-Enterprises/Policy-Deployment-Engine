package terraform.gcp.security.cloud_bigtable.google_bigtable_table_iam_member.no_public_access
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_table_iam_member.vars
# Table-level IAM can expose row data to the internet or any signed-in Google account.
# Instance IAM does not subsume table IAM; both must be restricted.
conditions := [
	[
		{
			"situation_description": "Bigtable table IAM member grants access to public or overly broad principals.",
			"remedies": [
				"Remove allUsers and allAuthenticatedUsers from table IAM bindings.",
				"Grant roles only to explicit users, groups, service accounts, or domain: principals.",
			],
		},
		{
			"condition": "member must not be a public principal",
			"attribute_path": ["member"],
			"values": ["allUsers", "allAuthenticatedUsers"],
			"policy_type": "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
