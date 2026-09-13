package terraform.gcp.security.api_hub.google_apihub_curation.endpoint_application_integration_endpoint_details_uri

import data.terraform.gcp.security.api_hub.google_apihub_curation.vars
import data.terraform.helpers.shared

# The Application Integration host, project, and location are deployment-specific.
# This rule therefore constrains only the transport scheme.
conditions := []

endpoint_path := ["endpoint", 0, "application_integration_endpoint_details", 0, "uri"]

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
  "Situation 1: API Hub curation endpoint URI must use HTTPS.",
  sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
  "Potential Remedies: Use an https:// URI for the Application Integration endpoint."
]

details := [{
  "situation": "API Hub curation endpoint URI must use HTTPS.",
  "remedies": ["Use an https:// URI for the Application Integration endpoint."],
  "non_compliant_resources": non_compliant_names
}]
