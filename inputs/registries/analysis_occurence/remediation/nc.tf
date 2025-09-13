# Non-compliant: empty payload, invalid-base64 signature, email-like public_key_id
resource "google_container_analysis_occurrence" "nc" {
  resource_uri = "https://gcr.io/sixth-oxygen-468910-f1/image@sha256:456def"
  note_name    = "projects/sixth-oxygen-468910-f1/notes/example-note-nc"

  attestation {
    serialized_payload = ""              # banned empty value
    signatures {
      signature     = "not$$base64??"    # contains invalid chars -> blacklisted
      public_key_id = "user@example.com" # email-like -> blacklisted
    }
  }

  project = "sixth-oxygen-468910-f1"
}
