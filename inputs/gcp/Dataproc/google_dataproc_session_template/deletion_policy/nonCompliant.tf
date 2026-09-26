resource "google_dataproc_session_template" "non_compliant_example_1" {
  project         = "test-project"
  name            = "non-compliant-session-template"
  location        = "australia-southeast1"
  deletion_policy = "DELETE"

  environment_config {
    execution_config {
      service_account = "dataproc-sa@my-project.iam.gserviceaccount.com"
    }
  }
}