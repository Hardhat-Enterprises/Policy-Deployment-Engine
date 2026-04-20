resource "google_binary_authorization_attestor" "c1" {
  name        = "c1"
  description = "Valid attestor with authorized member"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "secure-key"
      pkix_public_key {
        public_key_pem      = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwlQq+FHDujbB5YaqmS9m
fL5/NfaOS4YEdhzjz5wRgOqR9LJ0eB0F9qu7D+S5V8nXcVdcwFvCpc6fFJIBay0M
+VUlZTpjMpphDFFWlQIDAQAB
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PSS_2048_SHA256"
      }
    }
  }
}

resource "google_binary_authorization_attestor_iam_member" "c1" {
  attestor = "projects/my-secure-project/attestors/attestor1"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:valid-sa@my-secure-project.iam.gserviceaccount.com"
}
