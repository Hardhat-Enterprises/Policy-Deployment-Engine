package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.pubsub_configs

import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The format of the Cloud Pub/Sub messages is not set to JSON.",
		"remedies": ["Set the message_format attribute to JSON."],
	},
	{
		"condition": "Check if the message_format attribute of pubsub_configs is set to JSON.",
		"attribute_path": ["pubsub_configs", "message_format"],
		"values": ["JSON"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
