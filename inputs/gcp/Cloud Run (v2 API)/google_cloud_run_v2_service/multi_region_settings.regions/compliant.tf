resource "google_cloud_run_v2_service" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "global"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_INTERNAL_ONLY"
  invoker_iam_disabled = false

  multi_region_settings {
    regions = ["australia-southeast1"]
  }

  template {
    service_account = "my-sa@my-project.iam.gserviceaccount.com"
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}