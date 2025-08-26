resource "google_binary_authorization_attestor" "good_attestor" {
  project     = "my-gcp-project"
  name        = "projects/my-gcp-project/attestors/test-attestor"
  description = "A valid attestor with attestation_authority_note and valid public key"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/test-note"
    public_keys {
      id = "test-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBg...
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PSS_2048_SHA256"
      }
    }
  }
}
