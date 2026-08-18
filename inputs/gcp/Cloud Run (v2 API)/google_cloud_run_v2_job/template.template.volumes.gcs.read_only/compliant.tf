resource "google_cloud_run_v2_job" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      volumes {
        name = "c"
        gcs {
          bucket    = "my-secure-bucket"
          read_only = true
        }
      }
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}
