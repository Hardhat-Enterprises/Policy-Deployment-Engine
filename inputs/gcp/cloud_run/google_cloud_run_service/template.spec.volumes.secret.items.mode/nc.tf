resource "google_cloud_run_service" "nc" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"

        volume_mounts {
          name       = "secret-volume"
          mount_path = "/secrets"
        }
      }

      volumes {
        name = "secret-volume"

        secret {
          secret_name  = "prod-db-secret"
          default_mode = 256

          items {
            key  = "latest"
            path = "db-password"
            mode = 511
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