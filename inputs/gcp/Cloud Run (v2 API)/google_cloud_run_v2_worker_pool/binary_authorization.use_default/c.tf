resource "google_cloud_run_v2_worker_pool" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  binary_authorization {
    use_default = true
  }

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}