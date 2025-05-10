resource "google_container_analysis_note" "nc" {
  name    = "nc"
  project = "sixth-oxygen-468910-f1"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  # Non-compliant: no expiration time set (defaults to null)
}
