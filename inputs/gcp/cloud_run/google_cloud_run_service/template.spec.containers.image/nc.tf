resource "google_cloud_run_service" "nc" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "docker.io/random/unsafe-image:latest"
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}