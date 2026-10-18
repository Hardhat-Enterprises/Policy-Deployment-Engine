resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant-session-template"
  location = "australia-southeast1"

  runtime_config {
    container_image = "australia-southeast1-docker.pkg.dev/test-project/repo/spark:1.0"
  }
}
