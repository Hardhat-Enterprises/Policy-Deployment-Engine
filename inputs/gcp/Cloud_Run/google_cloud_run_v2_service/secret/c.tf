resource "google_cloud_run_v2_service" "c" {
  name     = "cloud-run-service-c"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"

      env {
        name  = "DB_PASSWORD"
        value = "safe-placeholder"
      }

      resources {
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
      }

      volume_mounts {
        mount_path = "/secrets"
        name       = "secret-volume"
      }
    }

    volumes {
      name = "secret-volume"

      secret {
        secret = "projects/my-project/secrets/db-password"
      }
    }

    service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
  }
}
