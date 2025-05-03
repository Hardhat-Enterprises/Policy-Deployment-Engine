# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_job" "c" {
  name     = "cloud_run_secret-c"
  location = "AU"

  template {
    template {
      volumes {
        name = "secret-volume"
        secret {
          secret = "my-secret"
        }
      }

      containers {
        image = "gcr.io/example/image"

        volume_mounts {
          name       = "secret-volume"
          mount_path = "/secrets"
        }
      }
    }
  }
}
