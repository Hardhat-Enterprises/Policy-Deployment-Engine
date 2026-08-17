package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_service_account_auth_config_service_account

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars

is_default_service_account(service_account) if {
	is_string(service_account)
	endswith(lower(service_account), "-compute@developer.gserviceaccount.com")
}

is_default_service_account(service_account) if {
	is_string(service_account)
	endswith(lower(service_account), "@appspot.gserviceaccount.com")
}

violating_resources := {resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	auth_configs := object.get(resource.values, ["service_directory", 0, "generic_web_service", 0, "service_account_auth_config"], [])
	is_array(auth_configs)
	count(auth_configs) > 0
	service_account := object.get(auth_configs[0], "service_account", "")
	is_default_service_account(service_account)
}

non_compliant_names := sort([name |
	some resource in violating_resources
	name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
])

resource_count := count([resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
])

display_names(names) := ["None - All passed"] if {
	count(names) == 0
}

display_names(names) := names if {
	count(names) > 0
}

message := [
	sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, resource_count]),
	"Situation 1: The Service Directory webhook authenticates with a default service account",
	sprintf("Non-Compliant Resources: %s", [concat(", ", display_names(non_compliant_names))]),
	"Potential Remedies: Use a dedicated least-privileged service account for webhook authentication",
]

details := [{
	"situation": "The Service Directory webhook authenticates with a default service account",
	"remedies": ["Use a dedicated least-privileged service account for webhook authentication."],
	"non_compliant_resources": non_compliant_names,
	"conditions": ["Reject Compute Engine and App Engine default service-account addresses."],
}]
