
resource "google_cloud_run_v2_service" "c" {
  name     = "cloud_run_service-c"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"
    }
  }
}


resource "google_cloud_run_v2_service_iam_binding" "c" {
  name     = google_cloud_run_v2_service.c.name
  location = google_cloud_run_v2_service.c.location
  role     = "roles/run.invoker"

  members = [
    "serviceAccount:secure-user@your-project-id.iam.gserviceaccount.com"
  ]
}
