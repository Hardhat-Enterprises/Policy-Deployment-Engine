resource "google_cloud_run_v2_job" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  project  = "my-project"

  template {
    template {
      service_account = "my-sa@my-project.iam.gserviceaccount.com"

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}
