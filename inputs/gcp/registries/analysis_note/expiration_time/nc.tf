resource "google_container_analysis_note" "nc" {
  name = "nc"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  project = "sixth-oxygen-468910-f1"
}
