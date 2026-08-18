resource "google_clouddeploy_target_iam_member" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  project  = "my-project-name"
  location = "us-central1"
  role     = "roles/clouddeploy.developer"
  member   = "allAuthenticatedUsers"
}
