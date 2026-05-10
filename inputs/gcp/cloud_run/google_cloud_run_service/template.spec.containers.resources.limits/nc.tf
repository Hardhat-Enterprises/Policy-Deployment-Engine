resource "google_cloud_run_service" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        resources {
          limits = {
            cpu = "8"
          }
        }
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}
