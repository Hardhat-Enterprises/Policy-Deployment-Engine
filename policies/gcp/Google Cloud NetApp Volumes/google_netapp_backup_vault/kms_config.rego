package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.kms_config

import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup_vault.vars
import data.terraform.helpers.shared

# A backup vault should use a valid NetApp KMS configuration resource.
# The project, location, and KMS configuration name are deployment-specific,
# so this policy validates the resource path structure rather than hard-coding them.
conditions := []

kms_config_path := ["kms_config"]

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    kms_config := shared.get_attribute_value(resource, kms_config_path)
    not is_string(kms_config)
}

non_compliant_resource(resource) if {
    kms_config := shared.get_attribute_value(resource, kms_config_path)
    is_string(kms_config)
    not regex.match("^projects/[^/]+/locations/[^/]+/kmsConfigs/[^/]+$", kms_config)
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
    "Situation 1: NetApp backup vaults must use a valid customer-managed encryption key configuration.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Set kms_config to a valid NetApp KMS configuration resource path using projects/{project}/locations/{location}/kmsConfigs/{name}."
]

details := [{
    "situation": "NetApp backup vaults must use a valid customer-managed encryption key configuration.",
    "remedies": [
        "Set kms_config to a valid NetApp KMS configuration resource path using projects/{project}/locations/{location}/kmsConfigs/{name}."
    ],
    "non_compliant_resources": non_compliant_names
}]