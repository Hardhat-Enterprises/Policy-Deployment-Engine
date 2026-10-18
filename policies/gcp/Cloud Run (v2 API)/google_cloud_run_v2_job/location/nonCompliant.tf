resource "google_cloud_run_v2_job" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
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
