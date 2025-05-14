package terraform.gcp.security.azurecluster.cluster.azure_services_authentication

default message = []

message = violations

violations := [msg | 
  some i
  resource := input.planned_values.root_module.resources[i]
  resource.type == "google_container_azure_cluster"

  admin_user := resource.values.authorization[0].admin_users[0].username
  admin_user == ""  # matches the empty string case

  msg := sprintf("Cluster '%s' has empty admin username in authorization.admin_users", [resource.name])
]
