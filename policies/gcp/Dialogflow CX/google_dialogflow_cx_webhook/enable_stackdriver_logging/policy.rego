package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.enable_stackdriver_logging

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The deprecated conversation-query logging setting is not enabled.",
		"remedies": ["For legacy configurations, set enable_stackdriver_logging to true. Verify replacement agent-level logging separately; this check does not guarantee webhook request, response, or error logging."],
	},
	{
		"condition": "Require the legacy conversation-query logging setting to be enabled",
		"attribute_path": ["enable_stackdriver_logging"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
