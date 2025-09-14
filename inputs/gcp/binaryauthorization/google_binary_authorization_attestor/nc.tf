resource "google_binary_authorization_attestor" "bad_attestor" {
  name    = "bad-attestor"
  project = "my-gcp-project"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/my-note"
  }
}
