# Compliant Cloud Run v2 Service with VPC Access

resource "google_cloud_run_v2_service" "c" {
  name     = "cloud_run_service-c"
  location = "AU"

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
