resource "google_cloud_run_service" "insecure_service" {
  name     = "cloudrun-srv"
  location = "australia-southeast1"

  metadata {
    annotations = {
      "run.googleapis.com/binary-authorization-breakglass" = "emergency-bypass"
    }
  }

  template {
    spec {
      containers {
        image = "docker.io/nginx:latest"
      }
    }
  }
}