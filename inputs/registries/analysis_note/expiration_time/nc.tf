# Non-Compliant Resource for Expiration Time (nc)
# This resource will be non-compliant if expiration_time is outside the valid range (1 to 365 days)

resource "google_container_analysis_note" "nc" {
  name = "example-note-nc"  # Name of the non-compliant note

  attestation_authority {
    hint {
      human_readable_name = "Build"
    }
  }

  # Expiration time outside valid range (greater than 365 days or less than 1 day)
  expiration_time = 400 # Example of a non-compliant expiration time (outside the range)

  project = "my-test-project-id"  # Replace with actual project ID
}
