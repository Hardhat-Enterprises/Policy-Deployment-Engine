resource "google_cloud_run_service" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        env {
          name  = "DB_PASSWORD"
          value = "password"
        }
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}
