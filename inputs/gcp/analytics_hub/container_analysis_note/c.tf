resource "google_container_analysis_note" "c" {
  name = "attestor-note"

  short_description = "Compliance attestor note"
  long_description  = "A longer description of a valid attestor note with proper metadata"
  expiration_time   = "2120-10-02T15:01:23.045123456Z"

  related_url {
    url   = "https://security.example.com/attestor"
    label = "compliance-link"
  }

  attestation_authority {
    hint {
      human_readable_name = "Compliant Attestor"
    }
  }
}
