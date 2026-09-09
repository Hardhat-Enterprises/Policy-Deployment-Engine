resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant_example_1"
  location = "australia-southeast1"

  environment_config {
    execution_config {
      kms_key = "projects/my-project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-key"
    }
  }
}
