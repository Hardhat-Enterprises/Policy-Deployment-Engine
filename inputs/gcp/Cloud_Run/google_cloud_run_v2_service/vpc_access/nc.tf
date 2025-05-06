# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Non-Compliant Cloud Run v2 Service with no VPC Access

resource "google_cloud_run_v2_service" "nc" {
  name     = "cloud_run_service-nc"
  location = "AU"

  template {
    containers {
      image = "gcr.io/my-project/my-image"
    }

    service_account = "my-custom-sa@my-project.iam.gserviceaccount.com"
  }
}
