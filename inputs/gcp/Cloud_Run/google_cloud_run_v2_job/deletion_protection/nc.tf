# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloud_run_v2_job" "nc" {
  name     = "cloudrun-job-nc"
  location = "AU"
  deletion_protection = false  

  template {
    task_count = 1
    template {
      containers {
        image = "gcr.io/my-project/my-image"
      }
    }
  }
}
