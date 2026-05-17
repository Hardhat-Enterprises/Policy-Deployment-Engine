resource "google_cloud_run_service" "c" {
  name = "c"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    annotations = {
      "run.googleapis.com/binary-authorization-breakglass" = ""
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
