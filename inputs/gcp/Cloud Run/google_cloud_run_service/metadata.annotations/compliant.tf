# Compliant — top-level metadata.annotations satisfying every merged scenario
resource "google_cloud_run_service" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
    annotations = {
      "run.googleapis.com/ingress" = "internal"
      "run.googleapis.com/binary-authorization-breakglass" = ""
      "run.googleapis.com/custom-audiences" = "trusted-client"
    }
  }

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
