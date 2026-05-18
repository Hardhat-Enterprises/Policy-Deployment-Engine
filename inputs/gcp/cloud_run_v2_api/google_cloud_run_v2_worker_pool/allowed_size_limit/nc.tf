resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "us-central1"
  deletion_protection = false
  project             = "my-project"

  template {
    volumes {
      name = "nc"
      empty_dir {
        size_limit = "2Gi"
      }
    }
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}