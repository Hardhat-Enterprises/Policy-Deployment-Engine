package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_oauth_config_scopes

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

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

# OAuth is optional. Only evaluate resources with an OAuth block; otherwise a
# missing scopes path would be mistaken for an invalid OAuth configuration.
# Normalisation is local to this evaluation and never alters the Terraform plan.
oauth_resources := [normalised |
	some resource in input.planned_values.root_module.resources
	resource.type == vars.variables.resource_type
	oauth := object.get(resource.values, ["generic_web_service", 0, "oauth_config"], [])
	is_array(oauth)
	count(oauth) > 0
	scopes := object.get(oauth[0], "scopes", null)
	normalised := json.patch(resource, [{
		"op": "add",
		"path": ["values", "generic_web_service", 0, "oauth_config", 0, "scopes"],
		"value": normalise_scopes(scopes),
	}])
]

normalise_scopes(scopes) := [normalise_scope(scope) | some scope in scopes] if {
	is_array(scopes)
} else := scopes

normalise_scope(scope) := "" if {
	is_string(scope)
	trim_space(scope) == ""
} else := lower(scope) if {
	is_string(scope)
} else := scope

result := summary if {
	summary := helpers.get_multi_summary(conditions, vars.variables) with input.planned_values.root_module.resources as oauth_resources
}

message := result.message
details := result.details
