resource "google_cloudbuildv2_connection_iam_member" "compliant_example_1" {
  project  = "compliant_example_1"
  location = "australia-southeast2"
  name     = "my-connection"
  role     = "roles/cloudbuild.connectionViewer"
  member   = "user:jane@example.com"
}
