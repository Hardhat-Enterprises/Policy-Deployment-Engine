resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant-session-template"
  location = "australia-southeast1"

  environment_config {
    execution_config {
      kms_key = "projects/test-project/locations/australia-southeast1/keyRings/test-ring/cryptoKeys/test-key"
    }
  }
}
