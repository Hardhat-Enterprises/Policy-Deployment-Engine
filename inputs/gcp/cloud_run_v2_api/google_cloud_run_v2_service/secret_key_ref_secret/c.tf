resource "google_cloud_run_v2_service" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      env {
        name = "c"
        value_source {
          secret_key_ref {
            secret  = "projects/my-project/secrets/api-key"
            version = "latest"
          }
        }
      }
    }
  }
}