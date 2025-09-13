resource "google_container_analysis_note" "c" {
  name   = "example-note"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  project = "sixth-oxygen-468910-f1"
}
