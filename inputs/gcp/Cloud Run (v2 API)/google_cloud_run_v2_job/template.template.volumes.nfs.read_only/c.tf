resource "google_cloud_run_v2_job" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      volumes {
        name = "c"
        nfs {
          server    = "10.0.0.5"
          path      = "/export/share"
          read_only = true
        }
      }
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}