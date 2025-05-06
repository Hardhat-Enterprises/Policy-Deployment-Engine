
resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud_run_service-nc"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"
    }
  }
}

resource "google_cloud_run_v2_service_iam_binding" "nc" {
  name     = google_cloud_run_v2_service.nc.name
  location = google_cloud_run_v2_service.nc.location
  role     = "roles/owner"

  members = [
    "allUsers"
  ]
}
