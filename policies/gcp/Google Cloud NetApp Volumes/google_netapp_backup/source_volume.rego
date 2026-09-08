package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.source_volume

import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_backup.vars
import data.terraform.helpers.shared

# The project and volume name are deployment-specific.
# This policy validates that source_volume uses the expected Google Cloud
# NetApp volume resource path and an approved Australian region.
conditions := []

source_volume_path := ["source_volume"]

resources := [
    resource |
    resource := input.planned_values.root_module.resources[_]
    resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
    source_volume := shared.get_attribute_value(resource, source_volume_path)
    not is_string(source_volume)
}

non_compliant_resource(resource) if {
    source_volume := shared.get_attribute_value(resource, source_volume_path)
    is_string(source_volume)
    not regex.match("^projects/[^/]+/locations/australia-southeast[12]/volumes/[^/]+$", source_volume)
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
    "Situation 1: Backup source volumes must reference a valid Google Cloud NetApp volume in an approved Australian region.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
    "Potential Remedies: Set source_volume to a valid NetApp volume resource path in australia-southeast1 or australia-southeast2."
]

details := [{
    "situation": "Backup source volumes must reference a valid Google Cloud NetApp volume in an approved Australian region.",
    "remedies": ["Set source_volume to a valid NetApp volume resource path in australia-southeast1 or australia-southeast2."],
    "non_compliant_resources": non_compliant_names
}]
