# Compliant Container Analysis Occurrence (remediation)
resource "google_container_analysis_occurrence" "c" {
  resource_uri = "https://gcr.io/sixth-oxygen-468910-f1/image@sha256:123abc"
  note_name    = "projects/sixth-oxygen-468910-f1/notes/example-note"

  attestation {
    # base64 payload (example)
    serialized_payload = "dGVzdCBwYXlsb2FkCg=="

    signatures {
      # base64 signature (example)
      signature     = "U2lnbmVkUmVzcG9uc2VXaXRoVGVzdFNpZ25hdHVyZQ=="
      public_key_id = "openpgp4fpr:74FAF3B861BDA0870C7B6DEF607E48D2A663AEEA"
    }
  }

  project = "sixth-oxygen-468910-f1"
}
