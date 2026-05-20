resource "google_cloud_run_service" "c" {
  name = "c"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        resources {
          requests = {
            cpu = "1"
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
