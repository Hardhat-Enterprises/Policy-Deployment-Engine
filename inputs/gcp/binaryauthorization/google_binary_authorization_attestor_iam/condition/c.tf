resource "google_binary_authorization_attestor" "good_attestor" {
  project     = "my-gcp-project"
  name        = "projects/my-gcp-project/attestors/test-attestor"
  description = "A valid attestor for testing"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/test-note"
    public_keys {
      id = "test-key"
      pkix_public_key {
        public_key_pem      = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBg...
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PSS_2048_SHA256"
      }
    }
  }
}

resource "google_binary_authorization_attestor_iam_member" "good_iam" {
  attestor = google_binary_authorization_attestor.good_attestor.name
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:my-sa@my-gcp-project.iam.gserviceaccount.com"
  project  = "my-gcp-project"
}
