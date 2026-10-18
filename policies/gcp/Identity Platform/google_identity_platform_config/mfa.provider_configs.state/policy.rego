package terraform.gcp.security.identity_platform.google_identity_platform_config.mfa_provider_configs_state

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

conditions := []

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    mfa_blocks := object.get(resource.values, "mfa", [])
    some mfa_block in mfa_blocks
    provider_configs := object.get(mfa_block, "provider_configs", [])
    some provider_config in provider_configs
    object.get(provider_config, "state", null) != "MANDATORY"
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
    "Situation 1: A configured MFA provider does not mandate multi-factor authentication.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Set every mfa.provider_configs.state value to MANDATORY."
]

details := [{
    "situation": "A configured MFA provider does not mandate multi-factor authentication.",
    "remedies": ["Set every mfa.provider_configs.state value to MANDATORY."],
    "non_compliant_resources": non_compliant_names
}]

