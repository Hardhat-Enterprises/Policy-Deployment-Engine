resource "google_cloud_run_v2_job" "nc" {
  name                = "nc"
  location            = "us-east1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}