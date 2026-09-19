resource "google_dialogflow_environment" "compliant_example_1" {
  project = "my_gcp_project"
  environmentid = "basic-environment"
  description = "basic environment"
  location       = "australia-southeast1"
}