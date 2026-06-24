resource "google_cloud_run_v2_job" "nc" {
  name                = "nc"
  location            = "us-central1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      volumes {
        name = "nc"
        nfs {
          server    = "10.0.0.5"
          path      = "/export/share"
          read_only = false
        }
      }
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}