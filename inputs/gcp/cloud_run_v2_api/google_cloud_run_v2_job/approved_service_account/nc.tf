resource "google_cloud_run_v2_job" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "my-project"

  template {
    template {
      service_account = ""

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job:v1"
      }
    }
  }
}