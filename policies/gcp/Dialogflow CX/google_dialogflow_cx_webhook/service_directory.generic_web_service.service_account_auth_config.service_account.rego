package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_service_account_auth_config_service_account

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars

conditions := [[
	{
		"situation_description": "The Service Directory webhook authenticates with a default service account",
		"remedies": ["Use a dedicated least-privileged service account for webhook authentication."],
	},
	{
		"condition": "Reject the Compute Engine default service account",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "service_account_auth_config", 0, "service_account"],
		"values": [
			"*-*@*",
			[
				[],
				["compute"],
				["developer.gserviceaccount.com"],
			],
		],
		"policy_type": "pattern blacklist",
	},
	{
		"condition": "Reject the App Engine default service account",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "service_account_auth_config", 0, "service_account"],
		"values": [
			"*@*",
			[
				[],
				["appspot.gserviceaccount.com"],
			],
		],
		"policy_type": "pattern blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details