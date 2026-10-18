resource "google_dialogflow_encryption_spec" "non_compliant_example_1" {
  project  = "my_gcp_project"
  location = "australia-southeast1"
  encryption_spec {
    kms_key = ""
  }
}