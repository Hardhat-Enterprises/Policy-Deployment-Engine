resource "google_cloud_run_v2_job" "nc" {
  name                = "nc"
  location            = "us-central1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      volumes {
        name = "nc"
        gcs {
          bucket    = "my-secure-bucket"
          read_only = false
        }
      }
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}