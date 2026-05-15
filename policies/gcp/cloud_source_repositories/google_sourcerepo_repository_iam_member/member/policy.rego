package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.vars

conditions := [[
	{
		"situation_description": "If the member/members attribute includes public identities such as allUsers or allAuthenticatedUsers, unauthorized users may gain access to the repository.",
		"remedies": ["Remove allUsers or allAuthenticatedUsers from the member/members attribute."],
	},
	{
		"condition": "check if the member/members attribute includes public identities such as allUsers or allAuthenticatedUsers",
		"attribute_path": ["member"],
		"values": ["allUsers", "allAuthenticatedUsers"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
