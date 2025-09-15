resource "google_binary_authorization_attestor" "bad_attestor" {
  name        = "attestor-without-keys"
  description = "Non-compliant attestor missing key details"
  project     = "my-insecure-project"

  attestation_authority_note {
    note_reference = "projects/my-insecure-project/notes/invalid-note"
    
    public_keys {}
  }
}
