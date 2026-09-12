resource "google_dataproc_session_template" "non_compliant_example_1" {
  project  = "test-project"
  name     = "non-compliant-session-template"
  location = "europe-west1"

  environment_config {
    execution_config {
      service_account = "dataproc-sa@my-project.iam.gserviceaccount.com"
    }
  }
}
