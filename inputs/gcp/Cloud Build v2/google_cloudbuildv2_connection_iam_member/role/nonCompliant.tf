resource "google_cloudbuildv2_connection_iam_member" "non_compliant_example_1" {
  project  = "non_compliant_example_1"
  location = "australia-southeast2"
  name     = "non_compliant_example_1"
  role     = "roles/editor"
  member   = "user:jane@example.com"
}
