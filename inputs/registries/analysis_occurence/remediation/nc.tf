# Non-Compliant Resource for Analysis Occurrence (nc)
# This resource will be non-compliant if serialized_payload, signature, or public_key_id are invalid or missing

resource "google_container_analysis_occurrence" "nc" {
  # URI that represents the resource for which the occurrence applies (example of Docker image)
  resource_uri = "https://gcr.io/project/image@sha256:456def"

  # The associated analysis note
  note_name = "projects/my-test-project-id/notes/example-note-nc"

  # Attestation block with missing/invalid data
  attestation {
    serialized_payload = ""  # Empty serialized payload (non-compliant)

    signatures {
      signature    = ""  # Empty signature (non-compliant)
      public_key_id = ""  # Empty public key ID (non-compliant)
    }
  }

  project = "my-test-project-id"  # Replace with your actual project ID
}
