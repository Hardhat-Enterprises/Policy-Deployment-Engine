# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_analysis_note" "c" {
  name = "example-note"  # Name of the note

  # Corrected attestation_authority block structure
  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  # Removed expiration_time for now
  project = "my-test-project-id"  # Replace with actual project ID when available
}
