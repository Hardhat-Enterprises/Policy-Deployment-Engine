resource "google_cloud_run_v2_job" "c" {
  name     = "cloud_run_job-c"
  location = "AU"

  template {
    template {
      service_account = "cloud-run-sa@your-project-id.iam.gserviceaccount.com"

      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}
