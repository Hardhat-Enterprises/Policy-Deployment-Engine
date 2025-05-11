package terraform.gcp.security.azureclient.client.location_blacklist

import input as tfplan

attribute_path := "location"
blacklisted_locations := {"global", "us-central1"}

deny[msg] if {
  some i
  tfplan.resource_changes[i].type == "google_container_azure_client"
  resource := tfplan.resource_changes[i]
  location := resource.change.after.location
  location != null
  location != ""
  location in blacklisted_locations

  msg := sprintf("GCS azure container '%s' is deployed in a blacklisted region: '%s'", [resource.change.after.name, location])
}

summary := {
  "message": sprintf("Total GCS azure container detected: %d", [count({r | r := tfplan.resource_changes[_]; r.type == "google_container_azure_client"})]),
  "non_compliant": sprintf("Non-compliant GCS azure container: %d", [count(deny)]),
  "details": deny
}
