package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_api_key_config_secret_version_for_api_key

import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars
import data.terraform.helpers.shared

# This rule uses structural validation because Secret Manager references contain
# tenant-specific project, secret, and version segments.
conditions := []

secret_version_path := ["open_api_spec", 0, "authentication", 0, "api_key_config", 0, "secret_version_for_api_key"]

resources := [
  resource |
  resource := input.planned_values.root_module.resources[_]
  resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
  secret_version := shared.get_attribute_value(resource, secret_version_path)
  not is_string(secret_version)
}

non_compliant_resource(resource) if {
  secret_version := shared.get_attribute_value(resource, secret_version_path)
  is_string(secret_version)
  not regex.match("^projects/[^/]+/secrets/[^/]+/versions/[^/]+$", secret_version)
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
  "Situation 1: Dialogflow CX Tool API-key credentials must use a Secret Manager secret version.",
  sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
  "Potential Remedies: Set secret_version_for_api_key to projects/{project}/secrets/{secret}/versions/{version}."
]

details := [{
  "situation": "Dialogflow CX Tool API-key credentials must use a Secret Manager secret version.",
  "remedies": ["Set secret_version_for_api_key to projects/{project}/secrets/{secret}/versions/{version}."],
  "non_compliant_resources": non_compliant_names
}]
