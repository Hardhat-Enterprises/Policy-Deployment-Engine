# Compliant Resource for Related URL (c)
# This resource will be compliant if related_url matches the allowed URL(s)

resource "google_container_analysis_note" "c" {
  name = "example-note"  # Name of the note

  attestation_authority {
    hint {
      human_readable_name = "QA"
    }
  }

  # Compliant related URL - must match allowed URLs
  related_url {
    url = "https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/tree/gcp/service/container_registries/policies/gcp"  # Example of a valid URL
    label = "Policy Deployment Engine"  # Optional label
  }

  project = "my-test-project-id"  # Replace with actual project ID
}
