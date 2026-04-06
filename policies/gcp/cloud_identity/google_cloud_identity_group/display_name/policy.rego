package terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name

import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

deny contains msg if {
    resource := input.resource_changes[_]
    resource.type == vars.variables.resource_type
    not resource.change.after.display_name

    msg := "Cloud Identity Group must have a display_name"}