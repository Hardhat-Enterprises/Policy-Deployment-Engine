resource "google_container_analysis_note" "nc" {
  name = "example-note-nc"

  # Violations: http scheme + metadata host + embedded creds example (any one is enough)
  related_url {
    url   = "http://metadata.google.internal/"   # banned scheme/host
    label = "Bad URL"
  }

  attestation_authority {
    hint { human_readable_name = "QA" }
  }

  project = "sixth-oxygen-468910-f1"
}
