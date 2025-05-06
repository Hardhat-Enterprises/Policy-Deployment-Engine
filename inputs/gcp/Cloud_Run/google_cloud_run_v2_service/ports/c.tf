# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_service" "c" {
  name     = "cloud-run-service-c"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"

      ports {
        container_port = 8080
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
