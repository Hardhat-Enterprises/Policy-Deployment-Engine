resource "google_container_analysis_note" "non_compliant_example_1" {
  name = "non_compliant_example_1"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  project = "sixth-oxygen-468910-f1"
}
