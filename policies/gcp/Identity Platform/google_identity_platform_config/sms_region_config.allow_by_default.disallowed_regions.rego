package terraform.gcp.security.identity_platform.google_identity_platform_config.sms_region_config_allow_by_default_disallowed_regions

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

conditions := []

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    sms_configs := object.get(resource.values, "sms_region_config", [])
    some sms_config in sms_configs
    allow_by_default_configs := object.get(sms_config, "allow_by_default", [])
    some allow_by_default_config in allow_by_default_configs
    is_array(object.get(allow_by_default_config, "disallowed_regions", null))
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
    "Situation 1: SMS routing uses allow-by-default regional access.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Replace allow_by_default with allowlist_only so only explicitly approved regions can receive verification SMS."
]

details := [{
    "situation": "SMS routing uses allow-by-default regional access.",
    "remedies": ["Replace allow_by_default with allowlist_only so only explicitly approved regions can receive verification SMS."],
    "non_compliant_resources": non_compliant_names
}]

