resource "google_cloud_run_service" "c" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}