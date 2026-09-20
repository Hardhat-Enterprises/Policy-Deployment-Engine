package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.generic_web_service_service_account_auth_config_service_account

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "The generic webhook authenticates with a default service account",
		"remedies": ["Use a dedicated least-privileged service account for webhook authentication."],
	},
	{
		"condition": "Reject the Compute Engine default service account",
		"attribute_path": ["generic_web_service", 0, "service_account_auth_config", 0, "service_account"],
		"values": [
			"*-compute@*",
			[
				[],
				["developer.gserviceaccount.com"],
			],
		],
		"policy_type": "pattern blacklist",
	},
	{
		"condition": "Reject the App Engine default service account",
		"attribute_path": ["generic_web_service", 0, "service_account_auth_config", 0, "service_account"],
		"values": [
			"*@*",
			[
				[],
				["appspot.gserviceaccount.com"],
			],
		],
		"policy_type": "pattern blacklist",
	},
]]

# Keep case-insensitive comparison local to this policy. Preserve resources
# without this optional auth block so they remain allowed.
normalised_resources := [normalise_account(resource) |
	some resource in input.planned_values.root_module.resources
]

normalise_account(resource) := normalised if {
	resource.type == vars.variables.resource_type
	account := object.get(resource.values, ["generic_web_service", 0, "service_account_auth_config", 0, "service_account"], null)
	is_string(account)
	normalised := json.patch(resource, [{
		"op": "replace",
		"path": ["values", "generic_web_service", 0, "service_account_auth_config", 0, "service_account"],
		"value": lower(account),
	}])
} else := resource

result := summary if {
	summary := helpers.get_multi_summary(conditions, vars.variables) with input.planned_values.root_module.resources as normalised_resources
}

message := result.message
details := result.details
