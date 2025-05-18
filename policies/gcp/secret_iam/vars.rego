package terraform.gcp.security.secretmanager.secret_iam.vars

friendly_resource_name := "GCP Secret IAM Binding"
resource_type := "google_secret_manager_secret_iam_binding"

variables := {
  "resource_type": resource_type,
  "friendly_resource_name": friendly_resource_name,
  "resource_value_name": "secret_id"
}
