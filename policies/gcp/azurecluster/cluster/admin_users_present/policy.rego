package terraform.gcp.security.azurecluster.cluster.admin_users_present

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.vars

deny = helpers.deny_with_messages[violation] {
  resource := input.planned_values.root_module.resources[_]
  resource.type == "google_container_azure_cluster"

  not resource.values.authorization.admin_users

  violation := {
    "msg": sprintf("%s '%s' does not have any admin users.", [vars.friendly_resource_name, resource.values.name]),
    "resource": resource.address
  }
}

summary.message = helpers.summary_from_violations(deny, vars.friendly_resource_name)





/* package terraform.gcp.security.azurecluster.cluster.admin_users_present

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.vars

resource_type = "google_container_azure_cluster"
friendly_resource_name = "GCP Azure Cluster"

default allow = false

deny = [res |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
  not res.values.authorization.admin_users
]

resources := [res |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
]

summary := {
  "message": [
    sprintf("Total %s detected: %d", [friendly_resource_name, count(resources)]),
    sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, count(deny), count(resources)])
  ]
}
*/