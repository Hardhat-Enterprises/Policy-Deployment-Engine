resource "google_cloud_run_v2_job" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}