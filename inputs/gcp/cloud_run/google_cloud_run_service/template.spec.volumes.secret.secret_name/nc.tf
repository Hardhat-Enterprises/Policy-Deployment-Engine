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
          secret_name = "random-secret"
        }
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}