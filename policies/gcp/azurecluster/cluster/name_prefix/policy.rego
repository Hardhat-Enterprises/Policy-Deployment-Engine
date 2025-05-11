package terraform.gcp.security.container_azure_cluster.name_prefix

import data.terraform.gcp.helpers
import data.terraform.gcp.security.container_azure_cluster.name_prefix.vars

scenarios_list := [
  {
    "situation_description": "Name does not start with required prefix",
    "remedies": ["Use a name starting with 'cluster-'"],
    "condition": "name must start with 'cluster-'",
    "attribute_path": ["name"],
    "values": ["cluster-"],
    "policy_type": "prefix"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)



/* package terraform.gcp.security.azurecluster.cluster.name_prefix

default deny = []

resource_type := "google_container_azure_cluster"
friendly_resource_name := "GCP Azure Cluster"
required_prefix := "cluster-"

resources := [res |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
]

deny := [msg |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
  not startswith(res.values.name, required_prefix)
  msg := sprintf("%s '%s' does not start with required prefix '%s'", [friendly_resource_name, res.values.name, required_prefix])
]

summary := {
  "message": [
    sprintf("Total %s detected: %d", [friendly_resource_name, count(resources)]),
    sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, count(deny), count(resources)])
  ]
}
*/