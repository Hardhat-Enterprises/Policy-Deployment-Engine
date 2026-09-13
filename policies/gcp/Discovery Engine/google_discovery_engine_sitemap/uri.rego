package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.uri

import data.terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.vars
import data.terraform.helpers.shared

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    uri := object.get(resource.values, "uri", null)
    not is_string(uri)
}

non_compliant_resource(resource) if {
    uri := object.get(resource.values, "uri", null)
    is_string(uri)
    not regex.match("^https://[^ ]+$", uri)
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
    "Situation 1: Sitemap URI must use HTTPS to prevent indexing of unauthorised content.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Set uri to a valid https:// URL e.g. https://www.example.com/sitemap.xml"
]

details := [{
    "situation": "Sitemap URI must use HTTPS to prevent indexing of unauthorised content.",
    "remedies": ["Set uri to a valid https:// URL e.g. https://www.example.com/sitemap.xml"],
    "non_compliant_resources": non_compliant_names
}]
