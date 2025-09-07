resource "google_binary_authorization_attestor_iam_binding" "bad_binding" {
  attestor = "invalid-attestor-ref"
  role = "roles/viewer"
  member = []
}
