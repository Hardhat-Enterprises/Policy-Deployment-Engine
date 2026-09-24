package terraform.gcp.security.identity_platform.google_identity_platform_config.blocking_functions_triggers_function_uri

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

conditions := []

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    blocks := object.get(resource.values, "blocking_functions", [])
    some block in blocks
    triggers := object.get(block, "triggers", [])
    some trigger in triggers
    function_uri := object.get(trigger, "function_uri", null)
    not is_string(function_uri)
}

non_compliant_resource(resource) if {
    blocks := object.get(resource.values, "blocking_functions", [])
    some block in blocks
    triggers := object.get(block, "triggers", [])
    some trigger in triggers
    function_uri := object.get(trigger, "function_uri", null)
    is_string(function_uri)
    not regex.match("^https://[^ ]+$", function_uri)
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
    "Situation 1: A configured blocking-function endpoint does not use HTTPS.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Use an https:// URI for every configured blocking-function trigger."
]

details := [{
    "situation": "A configured blocking-function endpoint does not use HTTPS.",
    "remedies": ["Use an https:// URI for every configured blocking-function trigger."],
    "non_compliant_resources": non_compliant_names
}]

