resource "google_binary_authorization_attestor" "nc1" {
  name        = "nc1"
  description = "Invalid member used"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "insecure-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzxyq3kWqR6NnEjrmqMfW
hgf7TyDkWZXts3HgYkE7z6Taf3CGw+uBzdyI4x6ZLQ3UzIdgkA9BgQIDAQAB
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PKCS1_SHA1"
      }
    }
  }
}

resource "google_binary_authorization_attestor_iam_member" "nc1" {
  attestor = "projects/my-secure-project/attestors/attestor1"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:hacker-sa@evil-project.iam.gserviceaccount.com"
}
