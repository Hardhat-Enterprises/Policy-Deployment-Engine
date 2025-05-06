resource "google_cloud_run_v2_service" "c" {
  name     = "cloud-run-service-c"
  location = "AU"

  ingress = "INGRESS_TRAFFIC_INTERNAL_ONLY"

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
