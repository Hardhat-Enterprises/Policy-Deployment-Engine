package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_allowed_ca_certs

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The generic webhook replaces Google's default TLS trust store with custom certificate authorities.",
		"remedies": ["Remove allowed_ca_certs unless an approved custom CA exception is required."],
	},
	{
		"condition": "Require the default Google TLS trust store",
		"attribute_path": ["generic_web_service", 0, "allowed_ca_certs"],
		"values": [null, []],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
