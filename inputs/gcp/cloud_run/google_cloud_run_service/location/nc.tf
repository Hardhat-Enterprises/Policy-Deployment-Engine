resource "google_cloud_run_service" "nc" {
  name     = "cloudrun-srv"
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