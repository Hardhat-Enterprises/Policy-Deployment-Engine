# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_job" "c" {
  name     = "cloudrun-job-c"
  location = "AU"

  template {
    task_count = 1
    template {
      containers {
        image = "gcr.io/my-org/secure-app:v1.2.3"
      }

      vpc_access {
        connector = "projects/my-project/locations/AU/connectors/my-vpc-connector"
      }

      service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
    }
  }
}
