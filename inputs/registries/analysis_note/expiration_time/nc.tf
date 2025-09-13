resource "google_container_analysis_note" "nc" {
  name            = "example-note-nc"
  expiration_time = "2042-01-01T00:00:00Z"  # far future => blacklisted

  # Still include the required block; keep name compliant to isolate the failure
  attestation_authority {
    hint { human_readable_name = "QA" }
  }

  project = "sixth-oxygen-468910-f1"
}
