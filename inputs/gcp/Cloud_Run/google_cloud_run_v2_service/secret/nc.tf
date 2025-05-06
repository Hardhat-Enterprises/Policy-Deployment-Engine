resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud-run-service-nc"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"

      env {
        name  = "DB_PASSWORD"
        value = "my-super-secret"  
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
