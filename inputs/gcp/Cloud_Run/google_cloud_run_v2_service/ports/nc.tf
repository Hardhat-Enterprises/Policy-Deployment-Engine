# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud-run-service-nc"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"

      ports {
        container_port = 3000
      }

      resources {
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
      }
    }

    service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
  }
}
