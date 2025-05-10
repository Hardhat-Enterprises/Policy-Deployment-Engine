# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_analysis_note" "nc" {
  name = "example-note-nc"  # Name of the non-compliant note

  # Corrected attestation_authority block structure
  attestation_authority {
    hint {
      human_readable_name = "Build"
    }
  }

  # Removed expiration_time for now
  project = "my-test-project-id"  # Replace with actual project ID when available
}
