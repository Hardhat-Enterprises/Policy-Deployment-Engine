resource "google_cloud_run_v2_worker_pool" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    volumes {
      name = "c"
      secret {
        secret = "projects/my-project/secrets/api-key"
      }
    }
    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:v1.0.0"
    }
  }
}
