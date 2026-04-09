resource "google_binary_authorization_attestor" "nc1" {
  name        = "nc1"
  description = "An invalid attestor"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    public_keys {
      id = "insecure-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyZZa0M+dQgxX7KgUtgmU
TqL6D+cE9grq4gX+9Kcq7Lo6mJ7ZVDCV9lR9sG6DL1fq5bHvQBr7gwIDAQAB
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "RSA_PKCS1_SHA1"
      }
    }
  }
}

resource "google_binary_authorization_attestor_iam_member" "nc1" {
  attestor = "projects/my-secure-project/attestors/invalid-reference"
  role     = "roles/containeranalysis.notes.attacher"
  member   = "serviceAccount:bad-sa@my-secure-project.iam.gserviceaccount.com"
}
