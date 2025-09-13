resource "google_container_analysis_note" "nc" {
  name = "example-note-nc"

  attestation_authority {
    hint {
      human_readable_name = "Dev"
    }
  }

  project = "sixth-oxygen-468910-f1"
}
