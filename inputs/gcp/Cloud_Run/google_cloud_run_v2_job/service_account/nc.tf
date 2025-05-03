# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

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
