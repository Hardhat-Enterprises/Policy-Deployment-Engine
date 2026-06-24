resource "google_cloud_run_v2_job" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"

        env {
          name  = "API_KEY"
          value = "hardcoded-secret-value"
        }

        env {
          name  = "nc"
          value = "my-db-password"
        }
      }
    }
  }
}