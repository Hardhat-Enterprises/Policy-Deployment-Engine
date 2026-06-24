resource "google_cloudbuildv2_connection_iam_member" "c" {
  project  = "c"
  location = "australia-southeast2"
  name     = "my-connection"
  role     = "roles/cloudbuild.connectionViewer"
  member   = "user:jane@example.com"
}