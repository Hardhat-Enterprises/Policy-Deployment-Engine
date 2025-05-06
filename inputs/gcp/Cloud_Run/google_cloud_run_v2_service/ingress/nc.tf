resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud-run-service-nc"
  location = "AU"

  ingress = "INGRESS_TRAFFIC_ALL"

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
