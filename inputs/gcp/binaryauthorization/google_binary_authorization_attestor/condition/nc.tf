# Case 1: Missing attestation_authority_note entirely
resource "google_binary_authorization_attestor" "bad_attestor_no_note" {
  project     = "my-gcp-project"
  name        = "projects/my-gcp-project/attestors/bad-attestor-no-note"
  description = "Attestor missing attestation_authority_note"
}

# Case 2: Has attestation_authority_note but missing public_keys
resource "google_binary_authorization_attestor" "bad_attestor_no_keys" {
  project     = "my-gcp-project"
  name        = "projects/my-gcp-project/attestors/bad-attestor-no-keys"
  description = "Attestor with note but no keys"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/test-note"
    # No public_keys provided
  }
}

# Case 3: Invalid signature algorithm
resource "google_binary_authorization_attestor" "bad_attestor_invalid_algo" {
  project     = "my-gcp-project"
  name        = "projects/my-gcp-project/attestors/bad-attestor-invalid-algo"
  description = "Attestor with invalid signature algorithm"

  attestation_authority_note {
    note_reference = "projects/my-gcp-project/notes/test-note"
    public_keys {
      id = "bad-key"
      pkix_public_key {
        public_key_pem = <<EOT
-----BEGIN PUBLIC KEY-----
MIIBIjANBg...
-----END PUBLIC KEY-----
EOT
        signature_algorithm = "INVALID_ALGO"
      }
    }
  }
}
