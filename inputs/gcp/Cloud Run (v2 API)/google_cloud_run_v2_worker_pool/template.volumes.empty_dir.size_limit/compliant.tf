resource "google_cloud_run_v2_worker_pool" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    volumes {
      name = "c"
      empty_dir {
        size_limit = "256Mi"
      }
    }
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}
