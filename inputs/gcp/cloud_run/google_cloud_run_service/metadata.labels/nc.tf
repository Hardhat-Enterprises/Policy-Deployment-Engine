resource "google_cloud_run_service" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "wrong-project"

    labels = {
      env = "random"
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
