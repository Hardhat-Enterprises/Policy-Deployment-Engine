package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_oauth_config_client_secret

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Service Directory webhook stores an OAuth client secret inline.",
		"remedies": ["Remove client_secret and use secret_version_for_client_secret instead."],
	},
	{
		"condition": "Disallow inline OAuth client secrets",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "oauth_config", 0, "client_secret"],
		"values": [null, ""],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
