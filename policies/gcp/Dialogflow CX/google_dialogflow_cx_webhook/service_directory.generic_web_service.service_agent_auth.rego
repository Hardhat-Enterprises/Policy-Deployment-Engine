package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_service_agent_auth

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The Service Directory webhook explicitly selects no service-agent authentication token.",
		"remedies": ["Use ID_TOKEN or ACCESS_TOKEN when service-agent authentication is selected."],
	},
	{
		"condition": "Disallow the NONE service-agent authentication mode",
		"attribute_path": ["service_directory", 0, "generic_web_service", 0, "service_agent_auth"],
		"values": ["NONE"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
