package terraform.gcp.security.identity_platform.google_identity_platform_config.sms_region_config_allowlist_only_allowed_regions

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

conditions := []

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

has_allowlist_only(resource) if {
    sms_configs := object.get(resource.values, "sms_region_config", [])
    some sms_config in sms_configs
    allowlist_configs := object.get(sms_config, "allowlist_only", [])
    some allowlist_config in allowlist_configs
    is_array(object.get(allowlist_config, "allowed_regions", null))
}

non_compliant_resources := [
    resource |
    resource := resources[_]
    not has_allowlist_only(resource)
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
    "Situation 1: SMS routing does not use an explicit regional allowlist.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Configure sms_region_config.allowlist_only.allowed_regions; select the approved regions for the workload."
]

details := [{
    "situation": "SMS routing does not use an explicit regional allowlist.",
    "remedies": ["Configure sms_region_config.allowlist_only.allowed_regions; select the approved regions for the workload."],
    "non_compliant_resources": non_compliant_names
}]

