resource "google_cloud_run_v2_job" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"

        env {
          name = "API_KEY"
          value_source {
            secret_key_ref {
              secret  = "api-key-secret"
              version = "latest"
            }
          }
        }

        env {
          name = "c"
          value_source {
            secret_key_ref {
              secret  = "db-secret"
              version = "latest"
            }
          }
        }
      }
    }
  }
}