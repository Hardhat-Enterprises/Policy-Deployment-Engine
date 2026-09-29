package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_uri

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Service Directory webhook endpoint does not use HTTPS.",
		"remedies": ["Use an https:// webhook URI so requests are encrypted in transit."],
	},
	{
		"condition": "Require the HTTPS URI scheme",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "uri"],
		"values": ["*://", [["https"]]],
		"policy_type": "pattern whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
