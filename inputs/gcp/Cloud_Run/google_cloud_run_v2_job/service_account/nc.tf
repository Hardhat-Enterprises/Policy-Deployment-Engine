resource "google_cloud_run_v2_job" "nc" {
  name     = "cloud_run_job-nc"
  location = "AU"

  template {
    template {
      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}
