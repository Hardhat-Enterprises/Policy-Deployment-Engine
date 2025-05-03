# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloud_run_v2_service" "c" {
  name     = "cloud_run_service-c"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"
    }
    service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
  }
}
