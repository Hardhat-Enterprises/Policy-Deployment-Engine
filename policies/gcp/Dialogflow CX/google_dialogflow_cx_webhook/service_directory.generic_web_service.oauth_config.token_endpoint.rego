package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_oauth_config_token_endpoint

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Service Directory webhook sends OAuth client credentials to a non-HTTPS token endpoint.",
		"remedies": ["Use an https:// OAuth token endpoint."],
	},
	{
		"condition": "Require HTTPS for the OAuth token endpoint",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "oauth_config", 0, "token_endpoint"],
		"values": ["*://", [["https"]]],
		"policy_type": "pattern whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
