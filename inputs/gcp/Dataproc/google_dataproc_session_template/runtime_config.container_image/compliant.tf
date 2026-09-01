resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant_example_1"
  location = "australia-southeast1"

  runtime_config {
    container_image = "us-docker.pkg.dev/my-project/dataproc/custom-runtime:1.0"
  }
}
