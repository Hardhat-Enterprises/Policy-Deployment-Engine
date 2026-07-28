resource "google_cloud_run_service" "non_compliant_example_1" {
  name = "non_compliant_example_1"
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
