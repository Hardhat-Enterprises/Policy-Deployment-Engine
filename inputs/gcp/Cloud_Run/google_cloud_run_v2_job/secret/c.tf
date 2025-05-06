resource "google_cloud_run_v2_job" "c" {
  name     = "cloud_run_secret-c"
  location = "AU"

  template {
    template {
      containers {
        image = "gcr.io/example/image"

        volume_mounts {
          name       = "secret-volume"
          mount_path = "/secrets"
        }
      }

      volumes {
        name = "secret-volume"

        secret {
          secret = "my-secret"
        }
      }
    }
  }
}
