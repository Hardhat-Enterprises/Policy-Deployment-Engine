resource "google_cloud_run_v2_worker_pool" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:v1.0.0"
      env {
        name = "c"
        value_source {
          secret_key_ref {
            secret  = "projects/my-project/secrets/api-key"
            version = "latest"
          }
        }
      }
    }
  }
}