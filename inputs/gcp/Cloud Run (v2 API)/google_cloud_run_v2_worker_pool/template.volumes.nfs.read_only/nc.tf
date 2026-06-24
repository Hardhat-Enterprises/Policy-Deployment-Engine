resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"


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
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}