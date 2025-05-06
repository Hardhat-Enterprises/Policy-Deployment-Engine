resource "google_cloud_run_v2_job" "c" {
  name     = "cloud_run_iam_job-c"
  location = "AU"

  template {
    template {
      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}

resource "google_cloud_run_v2_job_iam_binding" "c" {
  name     = google_cloud_run_v2_job.c.name
  location = google_cloud_run_v2_job.c.location
  role     = "roles/run.invoker"  

  members = [
    "serviceAccount:secure-user@your-project-id.iam.gserviceaccount.com"  # ✅ Specific member
  ]
}
