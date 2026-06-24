resource "google_cloud_run_v2_job" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      volumes {
        name = "c"
        gcs {
          bucket    = "my-secure-bucket"
          read_only = true
        }
      }
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}