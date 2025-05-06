resource "google_cloud_run_v2_job" "c" {
  name     = "cloudrun-job-c"
  location = "AU"

  template {
    task_count = 1
    template {
      containers {
        image = "gcr.io/my-project/my-image"
      }

      vpc_access {
        connector = "projects/my-project/locations/AU/connectors/my-vpc-connector"
      }

      service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
    }
  }
}
