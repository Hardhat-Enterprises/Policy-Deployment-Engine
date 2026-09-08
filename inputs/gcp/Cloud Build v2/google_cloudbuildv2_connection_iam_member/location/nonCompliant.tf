resource "google_cloudbuildv2_connection_iam_member" "non_compliant_example_1" {
  project  = "non_compliant_example_1"
  location = "us-central1"
  name     = "non_compliant_example_1"
  role     = "roles/cloudbuild.connectionViewer"
  member   = "user:jane@example.com"
}
