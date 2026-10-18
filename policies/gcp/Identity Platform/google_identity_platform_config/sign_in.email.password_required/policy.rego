package terraform.gcp.security.identity_platform.google_identity_platform_config.sign_in_email_password_required

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

conditions := []

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    sign_in_blocks := object.get(resource.values, "sign_in", [])
    some sign_in_block in sign_in_blocks
    email_configs := object.get(sign_in_block, "email", [])
    some email_config in email_configs
    object.get(email_config, "enabled", false) == true
    object.get(email_config, "password_required", false) != true
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
    "Situation 1: Enabled email authentication permits sign-in without a password.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: When email authentication is enabled, set password_required to true."
]

details := [{
    "situation": "Enabled email authentication permits sign-in without a password.",
    "remedies": ["When email authentication is enabled, set password_required to true."],
    "non_compliant_resources": non_compliant_names
}]

