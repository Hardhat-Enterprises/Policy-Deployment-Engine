# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud-run-service-nc"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"

      resources {
        limits = {
          cpu    = "250m"    
          memory = "128Mi"    
        }
      }
    }

    service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
  }
}
