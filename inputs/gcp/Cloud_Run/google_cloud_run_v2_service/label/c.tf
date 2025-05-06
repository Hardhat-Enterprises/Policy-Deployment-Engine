# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_service" "c" {
  name     = "cloud-run-service-c"
  location = "AU"

  labels = {
    env         = "prod"
    owner       = "security-team"
    cost-center = "cc-12345"
  }

  template {
    containers {
      image = "gcr.io/my-project/my-image"

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
