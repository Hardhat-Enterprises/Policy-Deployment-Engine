resource "google_binary_authorization_attestor" "nc1" {
  name        = "nc1"
  description = "Non-compliant attestor with insecure signature algorithm"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "insecure-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7xY...
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PKCS1_SHA1"
      }
    }
  }
}
