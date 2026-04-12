package terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name

import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name.vars

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == vars.variables.resource_type
  not resource.change.after.display_name

  msg := sprintf("The %s must have a display_name.", [vars.variables.friendly_resource_name])
}