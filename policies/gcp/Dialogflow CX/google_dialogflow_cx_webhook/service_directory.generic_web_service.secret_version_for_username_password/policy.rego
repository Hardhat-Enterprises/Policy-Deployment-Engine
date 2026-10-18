package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_secret_version_for_username_password

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Service Directory webhook uses static HTTP Basic authentication credentials.",
		"remedies": ["Remove secret_version_for_username_password and use managed token, service-account, or OAuth authentication."],
	},
	{
		"condition": "Disallow HTTP Basic authentication credentials",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "secret_version_for_username_password"],
		"values": [null, ""],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
