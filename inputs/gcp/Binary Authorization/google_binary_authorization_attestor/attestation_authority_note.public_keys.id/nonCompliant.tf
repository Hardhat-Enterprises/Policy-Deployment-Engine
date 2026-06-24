resource "google_binary_authorization_attestor" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  description = "Non-compliant attestor with no public keys"
  project     = "my-secure-project"

  attestation_authority_note {
    note_reference = "projects/my-secure-project/notes/valid-note"

    # Missing public_keys block → triggers blacklist policy
  }
}
