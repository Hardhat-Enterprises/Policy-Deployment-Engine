resource "google_cloud_run_v2_worker_pool" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
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
