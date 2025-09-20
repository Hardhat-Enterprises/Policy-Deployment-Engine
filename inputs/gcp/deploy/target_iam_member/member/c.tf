resource "google_clouddeploy_target_iam_member" "c" {
  name     = "c"
  project  = "my-project-name"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  member   = "user:developer@example.com"
}