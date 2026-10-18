resource "google_cloud_run_v2_job" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  binary_authorization {
    use_default = true
  }

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}
