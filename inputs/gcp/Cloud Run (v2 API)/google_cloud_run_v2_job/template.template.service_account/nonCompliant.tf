resource "google_cloud_run_v2_job" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
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
