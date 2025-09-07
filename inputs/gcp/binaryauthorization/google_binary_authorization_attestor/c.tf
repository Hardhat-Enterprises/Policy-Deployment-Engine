resource "google_binary_authorization_attestor" "good_attestor" {
  name        = "good-attestor"
  description = "Compliant attestor for PDE testing"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "secure-key"
      pkix_public_key {
        public_key_pem      = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9vQ7Jbq0bEo+PjhvNUj
Z0Q7i2P5lctF7h8Lx3b5pkmAX8JrfZrHVq/H1ey+g4V7X3MmvEo5yB2v9B9UUN9r
E3N5Xz6dAQIDAQAB
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PSS_2048_SHA256"
      }
    }
  }
}
