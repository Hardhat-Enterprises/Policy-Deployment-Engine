package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_service_agent_auth

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The generic webhook does not explicitly select a supported service-agent authentication token.",
		"remedies": ["Set service_agent_auth to ID_TOKEN or ACCESS_TOKEN; NONE and omission do not satisfy this service-agent-token requirement."],
	},
	{
		"condition": "Require an explicit ID_TOKEN or ACCESS_TOKEN service-agent authentication mode",
		"attribute_path": ["generic_web_service", 0, "service_agent_auth"],
		"values": ["ID_TOKEN", "ACCESS_TOKEN"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
