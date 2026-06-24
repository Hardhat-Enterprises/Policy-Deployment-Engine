resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:v1.0.0"

      env {
        name  = "nc"
        value = "super-secret-hardcoded-value"
      }
    }
  }
}