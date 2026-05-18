resource "google_cloud_run_service" "c" {
  name = "c"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
  }

  template {
    metadata {
      labels = {
        env = "prod"
      }
    }

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
