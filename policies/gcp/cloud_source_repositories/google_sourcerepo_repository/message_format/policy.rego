package terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.message_format

import data.terraform.helpers
import data.terraform.gcp.security.cloud_source_repositories.google_sourcerepo_repository.vars

conditions := [[
	{
		"situation_description": "The format of the Cloud Pub/Sub messages is not set to JSON.",
		"remedies": ["Set the message_format attribute to JSON."],
	},
	{
		"condition": "Check if the message_format attribute of pubsub_message_format is set to JSON.",
		"attribute_path": ["pubsub_configs", "message_format"],
		"values": ["JSON"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
