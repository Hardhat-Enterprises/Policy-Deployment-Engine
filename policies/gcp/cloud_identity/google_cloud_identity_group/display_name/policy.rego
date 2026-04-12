package terraform.gcp.security.cloud_identity.google_cloud_identity_group.display_name

import data.terraform.gcp.security.cloud_identity.google_cloud_identity_group.vars

message[msg] if {
  resource := input.resource_changes[_]
  resource.type == vars.variables.resource_type
  resource.change.after != null
  object.get(resource.change.after, vars.variables.resource_value_name, null) == null

  msg := sprintf("%s %s is missing required attribute '%s'.", [vars.variables.friendly_resource_name, resource.address, vars.variables.resource_value_name])
}