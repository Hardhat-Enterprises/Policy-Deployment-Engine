resource "google_cloud_run_v2_job" "nc" {
  name     = "cloudrun-job-nc"
  location = "AU"

  template {
    task_count = 1
    template {
      containers {
        image = "gcr.io/my-project/my-image"
      }

    

      service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
    }
  }
}
