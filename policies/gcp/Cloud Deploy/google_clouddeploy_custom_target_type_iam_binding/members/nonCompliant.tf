resource "google_clouddeploy_custom_target_type_iam_binding" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  
  members = [
    "allUsers",
    "allAuthenticatedUsers",
    "user:admin@gmail.com"
  ]
}
