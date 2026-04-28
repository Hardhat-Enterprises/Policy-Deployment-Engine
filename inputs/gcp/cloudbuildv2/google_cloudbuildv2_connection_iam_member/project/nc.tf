resource "google_cloudbuildv2_connection_iam_member" "nc" {
  project  = "nc"
  location = "australia-southeast2"
  name     = "my-connection"
  role     = "roles/cloudbuild.connectionViewer"
  member   = "user:jane@example.com"
}