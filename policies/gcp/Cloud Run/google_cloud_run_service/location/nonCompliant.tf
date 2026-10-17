resource "google_cloud_run_service" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  location = "us-central1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
