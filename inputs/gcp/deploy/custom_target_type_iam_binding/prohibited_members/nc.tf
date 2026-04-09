resource "google_clouddeploy_custom_target_type_iam_binding" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  
  members = [
    "allUsers",
    "allAuthenticatedUsers",
    "user:admin@gmail.com"
  ]
}