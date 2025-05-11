# Compliant Resource for Analysis Occurrence (c)
# This resource will be compliant if serialized_payload, signature, and public_key_id are provided correctly

resource "google_container_analysis_occurrence" "c" {
  # URI that represents the resource for which the occurrence applies (example of Docker image)
  resource_uri = "https://gcr.io/project/image@sha256:123abc"

  # The associated analysis note
  note_name = "projects/my-test-project-id/notes/example-note"

  # Attestation block
  attestation {
    serialized_payload = "dGVzdCBwYXlsb2FkCg=="  # base64 encoded example payload

    signatures {
      signature    = "U2lnbmVkUmVzcG9uc2VXaXRoVGVzdFNpZ25hdHVyZQ=="  # Example signature (base64)
      public_key_id = "openpgp4fpr:74FAF3B861BDA0870C7B6DEF607E48D2A663AEEA"  # Example public key ID
    }
  }

  project = "my-test-project-id"  # Replace with your actual project ID
}
