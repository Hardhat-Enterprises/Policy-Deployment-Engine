package terraform.gcp.security.secretmanager.secret.vars

friendly_resource_name := "GCP Secret" 
resource_type := "google_secret_manager_secret" 
variables := {
  "resource_type": resource_type,
  "friendly_resource_name": friendly_resource_name,
  "resource_value_name": "name"
}