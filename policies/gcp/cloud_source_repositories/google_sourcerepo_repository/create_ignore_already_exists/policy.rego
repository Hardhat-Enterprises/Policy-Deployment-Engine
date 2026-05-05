package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.create_ignore_already_exists

import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The create_ignore_already_exists attribute is not set to true.",
		"remedies": ["Set the create_ignore_already_exists attribute to true."],
	},
	{
		"condition": "check if the create_ignore_already_exists attribute is set to true",
		"attribute_path": ["create_ignore_already_exists"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
