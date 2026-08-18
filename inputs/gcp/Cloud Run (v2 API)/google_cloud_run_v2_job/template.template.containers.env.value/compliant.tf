resource "google_cloud_run_v2_job" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"

        # No "value" field used anywhere
        env {
          name  = "API_KEY"
          value = ""
          value_source {
          }
        }

        env {
          name  = "c"
          value = ""
          value_source {
          }
        }
      }
    }
  }
}
