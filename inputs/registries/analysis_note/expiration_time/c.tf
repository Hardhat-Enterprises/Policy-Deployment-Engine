# Compliant Resource for Expiration Time (c)
# This resource will be compliant if expiration_time is within the valid range (1 to 365 days)

resource "google_container_analysis_note" "c" {
  name = "example-note"  # Name of the note

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  # Expiration time within valid range (1 to 365 days)
  expiration_time = 30  # Example of a valid expiration time within the range

  project = "my-test-project-id"  # Replace with actual project ID
}
