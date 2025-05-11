package terraform.gcp.security.azureclient.client.name_prefix

import input as tfplan

attribute_path := "name"
required_prefix := "client-"

deny[msg] if {
  some i
  tfplan.resource_changes[i].type == "google_container_azure_client"
  resource := tfplan.resource_changes[i]
  name := resource.change.after.name
  not startswith(name, required_prefix)

  msg := sprintf("GCS azure container '%s' has name '%s' which does not start with required prefix '%s'", [resource.change.after.name, name, required_prefix])
}

summary := {
  "message": sprintf("Total GCS azure container detected: %d", [count({r | r := tfplan.resource_changes[_]; r.type == "google_container_azure_client"})]),
  "non_compliant": sprintf("Non-compliant GCS azure container: %d", [count(deny)]),
  "details": deny
}
