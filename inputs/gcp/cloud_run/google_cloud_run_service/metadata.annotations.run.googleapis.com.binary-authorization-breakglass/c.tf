resource "google_cloud_run_service" "secure_service" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"

  metadata {
    annotations = {
      "run.googleapis.com/binary-authorization-breakglass" = ""
    }
  }

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/app:latest"
      }
    }
  }
}