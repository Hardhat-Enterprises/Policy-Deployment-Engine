resource "google_cloud_run_service" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = "projects/random-project/locations/us-central1/connectors/test-connector"
      }
    }

    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 80
    latest_revision = true
  }
}
