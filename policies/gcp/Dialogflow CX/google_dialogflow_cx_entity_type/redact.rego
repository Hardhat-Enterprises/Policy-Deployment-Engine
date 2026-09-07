package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_entity_type.redact

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_entity_type.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Extracted entity parameter values may be written to logs without redaction.",
		"remedies": ["Set redact to true."],
	},
	{
		"condition": "Require entity parameter redaction in logs",
		"attribute_path": ["redact"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
