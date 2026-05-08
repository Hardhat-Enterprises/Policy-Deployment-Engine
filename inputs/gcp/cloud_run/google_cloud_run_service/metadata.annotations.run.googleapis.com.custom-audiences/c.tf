resource "google_cloud_run_service" "c" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    annotations = {
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
}