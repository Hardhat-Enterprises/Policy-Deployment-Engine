package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_oauth_config_scopes

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars

known_broad_scopes := {
	"admin",
	"administrator",
	"all",
	"full",
	"full-access",
	"full_access",
	"https://www.googleapis.com/auth/cloud-platform",
}

scope_is_broad(scope) if {
	is_string(scope)
	trim_space(scope) == ""
}

scope_is_broad(scope) if {
	is_string(scope)
	contains(scope, "*")
}

scope_is_broad(scope) if {
	is_string(scope)
	lower(scope) in known_broad_scopes
}

scopes_are_non_compliant(scopes) if {
	scopes == null
}

scopes_are_non_compliant(scopes) if {
	is_array(scopes)
	count(scopes) == 0
}

scopes_are_non_compliant(scopes) if {
	is_array(scopes)
	some scope in scopes
	scope_is_broad(scope)
}

violating_resources := {resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	oauth_configs := object.get(resource.values, ["service_directory", 0, "generic_web_service", 0, "oauth_config"], [])
	is_array(oauth_configs)
	count(oauth_configs) > 0
	scopes := object.get(oauth_configs[0], "scopes", null)
	scopes_are_non_compliant(scopes)
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
	"Situation 1: The Service Directory webhook requests missing, wildcard-like, administrative, or known overly broad OAuth scopes",
	sprintf("Non-Compliant Resources: %s", [concat(", ", display_names(non_compliant_names))]),
	"Potential Remedies: Configure explicit provider-specific OAuth scopes that follow least privilege",
]

details := [{
	"situation": "The Service Directory webhook requests missing, wildcard-like, administrative, or known overly broad OAuth scopes",
	"remedies": ["Configure explicit provider-specific OAuth scopes that follow least privilege."],
	"non_compliant_resources": non_compliant_names,
	"conditions": ["Require non-empty scopes and reject wildcard-like or known broad values when OAuth is configured."],
}]
