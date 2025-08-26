# Has attestor but uses wrong role
resource "google_binary_authorization_attestor_iam_member" "bad_iam_wrong_role" {
  attestor = google_binary_authorization_attestor.good_attestor.name
  role     = "roles/viewer" #  wrong role
  member   = "user:fake-user@example.com" # syntactically valid IAM identity
  project  = "my-gcp-project"
}

# Has attestor and role but wrong member type
resource "google_binary_authorization_attestor_iam_member" "bad_iam_wrong_member" {
  attestor = google_binary_authorization_attestor.good_attestor.name
  role     = "roles/containeranalysis.notes.attacher"
  member   = "group:nonexistent@example.com" #  not intended member
  project  = "my-gcp-project"
}
