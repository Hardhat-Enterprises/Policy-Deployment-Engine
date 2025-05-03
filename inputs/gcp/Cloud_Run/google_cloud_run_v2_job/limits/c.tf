# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_job" "c" {
  name     = "cloud_run_limits-c"
  location = "AU"

  template {
    template {
      containers {
        image = "gcr.io/example/image"

        resources {
          limits = {
            cpu    = "1"
            memory = "512Mi"
          }
        }
      }
    }
  }
}

