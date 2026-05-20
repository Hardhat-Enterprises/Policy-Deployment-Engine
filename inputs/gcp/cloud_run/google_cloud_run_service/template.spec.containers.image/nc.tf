resource "google_cloud_run_service" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "docker.io/nginx"
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}
