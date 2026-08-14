package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.service_directory_generic_web_service_request_headers

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_webhook.vars

secret_header_names := {
	"api-key",
	"authorization",
	"proxy-authorization",
	"x-api-key",
	"x-auth-token",
}

violating_resources := {resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	headers := object.get(resource.values, ["service_directory", 0, "generic_web_service", 0, "request_headers"], {})
	is_object(headers)
	some header_name, header_value in headers
	lower(header_name) in secret_header_names
	header_value != null
	header_value != ""
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
	"Situation 1: The Service Directory webhook contains a secret-bearing inline request header",
	sprintf("Non-Compliant Resources: %s", [concat(", ", display_names(non_compliant_names))]),
	"Potential Remedies: Remove the inline credential and use secret_versions_for_request_headers",
]

details := [{
	"situation": "The Service Directory webhook contains a secret-bearing inline request header",
	"remedies": ["Remove the inline credential and use secret_versions_for_request_headers."],
	"non_compliant_resources": non_compliant_names,
	"conditions": ["Reject case-insensitive Authorization, API key, proxy authorization, and auth-token headers with inline values."],
}]
