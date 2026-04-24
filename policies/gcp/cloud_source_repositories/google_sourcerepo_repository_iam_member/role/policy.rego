package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.role

import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "If the role attribute is not set to roles/source.reader or roles/source.writer, the repository may be exposed to unauthorized access or modification.",
		"remedies": ["Set the role attribute to roles/source.reader or roles/source.writer."],
	},
	{
		"condition": "check if the role attribute is set to an approved least-privilege role",
		"attribute_path": ["role"],
		"values": ["roles/source.reader", "roles/source.writer"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
