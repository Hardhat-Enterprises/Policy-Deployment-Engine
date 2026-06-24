package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.repository

import data.terraform.helpers
import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository_iam_member.vars

conditions := [[
	{
		"situation_description": "The repository attribute is not configured with a valid parent repository.",
		"remedies": ["Provide a valid repository reference for the repository attribute."],
	},
	{
		"condition": "Check if the repository attribute is configured.",
		"attribute_path": ["repository"],
        "values": ["google_sourcerepo_repository.my_repo.name"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details