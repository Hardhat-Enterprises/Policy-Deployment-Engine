package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_oauth_config_token_endpoint

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars
import data.terraform.helpers.shared

# This rule uses structural validation because the hostname is application-specific.
conditions := []

endpoint_path := ["open_api_spec", 0, "authentication", 0, "oauth_config", 0, "token_endpoint"]

resources := [
  resource |
  resource := input.planned_values.root_module.resources[_]
  resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
  endpoint := shared.get_attribute_value(resource, endpoint_path)
  not is_string(endpoint)
}

non_compliant_resource(resource) if {
  endpoint := shared.get_attribute_value(resource, endpoint_path)
  is_string(endpoint)
  not regex.match("^https://", endpoint)
}

non_compliant_resources := [
  resource |
  resource := resources[_]
  non_compliant_resource(resource)
]

non_compliant_names := [
  shared.get_resource_attribute(resource, vars.variables.resource_value_name) |
  resource := non_compliant_resources[_]
]

non_compliant_display := concat(", ", non_compliant_names) if {
  count(non_compliant_names) > 0
}

non_compliant_display := "None - All passed" if {
  count(non_compliant_names) == 0
}

message := [
  sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(resources)]),
  "Situation 1: Dialogflow CX Tool OAuth token exchanges must use encrypted transport.",
  sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
  "Potential Remedies: Set token_endpoint to an HTTPS URL."
]

details := [{
  "situation": "Dialogflow CX Tool OAuth token exchanges must use encrypted transport.",
  "remedies": ["Set token_endpoint to an HTTPS URL."],
  "non_compliant_resources": non_compliant_names
}]
