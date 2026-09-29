resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant-session-template"
  location = "australia-southeast1"

  environment_config {
    execution_config {
      service_account = "dataproc-sa@my-project.iam.gserviceaccount.com"
    }
  }
}
