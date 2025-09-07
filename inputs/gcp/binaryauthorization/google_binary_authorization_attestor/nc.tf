resource "google_binary_authorization_attestor" "bad_attestor" {
  name        = "bad-attestor"
  description = "Non-compliant attestor missing keys"
  project     = "test-project"

  attestation_authority_note {
    # Bad format for note_reference (missing project/notes structure)
    note_reference = "invalid-note-ref"

    public_keys {
      id = "weak-key"
      pkix_public_key {
        public_key_pem = "fake-key"
        # Weak / disallowed algorithm
        signature_algorithm = "RSA_PSS_1024_SHA1"
      }
    }
  }
}
