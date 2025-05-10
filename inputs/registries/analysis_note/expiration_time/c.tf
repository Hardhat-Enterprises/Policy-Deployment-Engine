resource "google_container_analysis_note" "c" {
  name            = "c"
  project         = "sixth-oxygen-468910-f1"

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  # Compliant: has a proper expiration time
  expiration_time = "2030-12-31T23:59:59Z"
}
