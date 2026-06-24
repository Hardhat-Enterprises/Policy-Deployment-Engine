resource "google_cloud_run_v2_worker_pool" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"


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
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}