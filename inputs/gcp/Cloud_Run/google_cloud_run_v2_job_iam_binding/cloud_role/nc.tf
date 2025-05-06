resource "google_cloud_run_v2_job" "nc" {
  name     = "cloud_run_iam_job-nc"
  location = "AU"

  template {
    template {
      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}

resource "google_cloud_run_v2_job_iam_binding" "nc" {
  name     = google_cloud_run_v2_job.nc.name
  location = google_cloud_run_v2_job.nc.location
  role     = "roles/owner"  

  members = [
    "allUsers"  
  ]
}
