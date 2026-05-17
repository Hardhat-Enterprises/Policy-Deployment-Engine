resource "google_cloud_run_v2_job" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      max_retries = 10

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job:latest"
      }
    }
  }
}