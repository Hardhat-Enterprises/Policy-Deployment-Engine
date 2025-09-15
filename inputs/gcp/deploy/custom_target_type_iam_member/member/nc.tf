resource "google_clouddeploy_custom_target_type_iam_member" "nc" {
  name     = "custom-target-type-nc"
  location = "us-central1"
  project  = "my-project-id"
  role     = "roles/clouddeploy.releaser"
  member   = "allUsers"
}