resource "google_clouddeploy_target_iam_member" "compliant_example_1" {
  name     = "compliant_example_1"
  project  = "my-project-name"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  member   = "user:developer@example.com"
}
