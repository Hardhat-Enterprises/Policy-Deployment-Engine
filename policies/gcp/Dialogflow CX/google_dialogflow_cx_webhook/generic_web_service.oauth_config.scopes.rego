package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_oauth_config_scopes

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars

conditions := [[
	{
		"situation_description": "The generic webhook requests missing, wildcard-like, administrative, or known overly broad OAuth scopes",
		"remedies": ["Configure explicit provider-specific OAuth scopes that follow least privilege."],
	},
	{
		"condition": "Reject missing, empty, or known overly broad OAuth scopes",
		"attribute_path": ["generic_web_service", 0, "oauth_config", 0, "scopes"],
		"values": [
			null,
			[],
			"",
			"admin",
			"administrator",
			"all",
			"full",
			"full-access",
			"full_access",
			"https://www.googleapis.com/auth/cloud-platform",
		],
		"policy_type": "blacklist",
	},
	{
		"condition": "Reject OAuth scopes containing wildcard characters",
		"attribute_path": ["generic_web_service", 0, "oauth_config", 0, "scopes"],
		"values": ["*"],
		"policy_type": "element blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details