package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_request_headers

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The generic webhook contains a secret-bearing inline request header",
		"remedies": ["Remove the inline credential and use secret_versions_for_request_headers."],
	},
	{
		"condition": "Reject case-insensitive sensitive header names with non-empty inline values",
		"attribute_path": ["generic_web_service", 0, "request_headers"],
		"values": ["api-key", "authorization", "proxy-authorization", "x-api-key", "x-auth-token"],
		"policy_type": "map key blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
