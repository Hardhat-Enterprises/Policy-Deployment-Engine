package terraform.gcp.security.secretmanager.secret_version.vars

friendly_resource_name := "GCP Secret Version"
resource_type := "google_secret_manager_secret_version"
variables := {
  "resource_type": resource_type,
  "friendly_resource_name": friendly_resource_name,
  "resource_value_name": "secret"
}
