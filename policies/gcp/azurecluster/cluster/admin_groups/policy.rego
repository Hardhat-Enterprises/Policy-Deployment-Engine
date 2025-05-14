package terraform.gcp.security.azurecluster.cluster.admin_groups

default message = []

message = violations

violations := [msg |
  some i
  resource := input.planned_values.root_module.resources[i]
  resource.type == "google_container_azure_cluster"

  # Get admin_groups (if exists)
  groups := resource.values.authorization[0].admin_groups

  count(groups) == 0  
  msg := sprintf("Cluster '%s' has no admin_groups configured in authorization block", [resource.name])
]
