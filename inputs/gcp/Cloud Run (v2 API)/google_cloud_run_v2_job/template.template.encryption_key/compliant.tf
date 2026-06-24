resource "google_cloud_run_v2_job" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      encryption_key = "projects/my-project/locations/australia-southeast1/keyRings/run-keys/cryptoKeys/job-key"

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}
