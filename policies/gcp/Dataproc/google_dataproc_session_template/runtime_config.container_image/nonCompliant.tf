resource "google_dataproc_session_template" "non_compliant_example_1" {
  project  = "test-project"
  name     = "non-compliant-session-template"
  location = "australia-southeast1"

  runtime_config {
    container_image = "docker.io/library/spark:1.0"
  }
}
