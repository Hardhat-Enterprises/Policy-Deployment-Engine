resource "google_binary_authorization_attestor" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  description = "Compliant attestor with secure signature algorithm"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "insecure-key"
      pkix_public_key {
        public_key_pem      = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7xY...
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PKCS1_SHA1"
      }
    }
  }
}
