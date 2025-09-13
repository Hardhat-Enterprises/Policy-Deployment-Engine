resource "google_container_analysis_note" "c" {
  name            = "example-note"
  expiration_time = "2030-12-31T23:59:59Z"  # within allowed window

  # Required by provider schema even if our policy targets expiration_time
  attestation_authority {
    hint { human_readable_name = "QA" }
  }

  project = "sixth-oxygen-468910-f1"
}
