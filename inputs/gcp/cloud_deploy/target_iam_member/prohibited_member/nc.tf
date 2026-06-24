resource "google_clouddeploy_target_iam_member" "nc" {
  name     = "nc"
  project  = "my-project-name"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  member   = "allAuthenticatedUsers"
}