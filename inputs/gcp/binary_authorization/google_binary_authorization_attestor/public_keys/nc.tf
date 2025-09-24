resource "google_binary_authorization_attestor" "nc1" {
  name        = "nc1"
  description = "Non-compliant attestor missing key details"
  project     = "my-insecure-project"

  attestation_authority_note {
    note_reference = "projects/my-insecure-project/notes/invalid-note"
    
    public_keys {}
  }
}
