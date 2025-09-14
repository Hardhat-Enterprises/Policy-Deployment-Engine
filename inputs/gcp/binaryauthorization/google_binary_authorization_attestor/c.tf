resource "google_binary_authorization_attestor" "good_attestor" {
  name    = "good-attestor"
  project = "my-gcp-project"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/my-note"

    public_keys {
      id                = "key-1"
      ascii_armored_pgp_public_key = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArandomplaceholder
-----END PUBLIC KEY-----
EOT
      pkix_public_key {
        signature_algorithm = "RSA_PSS_2048_SHA256"
      }
    }
  }
}
