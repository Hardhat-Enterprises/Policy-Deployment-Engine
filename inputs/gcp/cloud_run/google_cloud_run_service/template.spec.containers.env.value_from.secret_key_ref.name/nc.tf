resource "google_cloud_run_service" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        env {
          name = "DB_PASSWORD"

          value_from {
            secret_key_ref {
              name = "random-secret"
              key  = "latest"
            }
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
