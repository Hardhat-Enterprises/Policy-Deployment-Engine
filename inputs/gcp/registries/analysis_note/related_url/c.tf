resource "google_container_analysis_note" "c" {
  name = "example-note"

  related_url {
    url   = "https://security.example.com/docs/attest"
    label = "Attestation Docs"
  }

  attestation_authority {
    hint { human_readable_name = "QA" }
  }

  project = "sixth-oxygen-468910-f1"
}
