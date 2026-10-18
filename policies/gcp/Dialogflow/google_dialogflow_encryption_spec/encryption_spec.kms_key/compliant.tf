resource "google_dialogflow_encryption_spec" "compliant_example_1" {
  project  = "my_gcp_project"
  location = "australia-southeast1"
  encryption_spec {
    kms_key = "projects/example-project/locations/australia-southeast1/keyRings/example-keyring/cryptoKeys/example-key"
  }
}