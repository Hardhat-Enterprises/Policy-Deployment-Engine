# Non-Compliant Resource for Related URL (nc)
# This resource will be non-compliant if related_url does not match the allowed URL(s)

resource "google_container_analysis_note" "nc" {
  name = "example-note-nc"  # Name of the non-compliant note

  attestation_authority {
    hint {
      human_readable_name = "Build"
    }
  }

  # Non-Compliant related URL - does not match the allowed URL
  related_url {
    url = "https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_analysis_note"  # Example of an invalid URL
    label = "Invalid URL"  # Optional label
  }

  project = "my-test-project-id"  # Replace with actual project ID
}
