resource "google_cloud_run_service" "compliant_example_1" {
  name = "compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      container_concurrency = 80

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
