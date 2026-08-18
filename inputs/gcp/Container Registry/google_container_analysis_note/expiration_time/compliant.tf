resource "google_container_analysis_note" "compliant_example_1" {
  name = "compliant_example_1"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  project         = "sixth-oxygen-468910-f1"
  expiration_time = "2030-12-31T23:59:59Z"
}
