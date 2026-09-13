resource "google_dialogflow_environment" "non_compliant_example_1" {
  project = "my_gcp_project"
  environmentid = "basic-environment"
  description = "basic environment"
  location       = "us-central1"
}