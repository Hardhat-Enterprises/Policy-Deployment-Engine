resource "google_cloud_run_v2_worker_pool" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "us-central1"
  deletion_protection = false
  project             = "my-project"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/worker-pool"
    }
  }
}
