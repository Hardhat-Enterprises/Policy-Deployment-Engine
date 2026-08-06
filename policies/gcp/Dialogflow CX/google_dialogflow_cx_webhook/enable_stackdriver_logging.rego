package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.enable_stackdriver_logging

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Dialogflow CX webhook activity logging is disabled.",
		"remedies": ["Set enable_stackdriver_logging to true to retain security monitoring and audit visibility."],
	},
	{
		"condition": "Require webhook activity logging",
		"attribute_path": ["enable_stackdriver_logging"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
