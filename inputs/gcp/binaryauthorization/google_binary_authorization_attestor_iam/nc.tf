resource "google_binary_authorization_attestor_iam_member" "bad_iam_member" {
  project  = "my-gcp-project"
  attestor = "projects/my-gcp-project/attestors/bad-attestor"

  role   = "roles/viewer"
  member = "user:invalid-user@example.com"
}
