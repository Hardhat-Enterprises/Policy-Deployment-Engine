resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    volumes {
      name = "nc"
      secret {
        secret = "projects/untrusted-project/secrets/unknown-secret"
      }
    }
    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:v1.0.0"
    }
  }
}