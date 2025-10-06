resource "google_binary_authorization_attestor" "nc1" {
  name        = "nc1"
  description = "Non-compliant attestor with incorrect IAM role"
  project     = "my-insecure-project"

  attestation_authority_note {
    note_reference = "projects/my-insecure-project/notes/invalid-note"

    public_keys {
      id = "weak-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwlQq+FHDujbB5YaqmS9m
fL5/NfaOS4YEdhzjz5wRgOqR9LJ0eB0F9qu7D+S5V8nXcVdcwFvCpc6fFJIBay0M
+VUlZTpjMpphDFFWlQIDAQAB
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PKCS1_2048_SHA256"
      }
    }
  }
}

resource "google_binary_authorization_attestor_iam_member" "nc1" {
  attestor = "projects/my-insecure-project/attestors/bad-attestor"
  role     = "roles/viewer"
  member   = "serviceAccount:invalid-sa@my-insecure-project.iam.gserviceaccount.com"
}
