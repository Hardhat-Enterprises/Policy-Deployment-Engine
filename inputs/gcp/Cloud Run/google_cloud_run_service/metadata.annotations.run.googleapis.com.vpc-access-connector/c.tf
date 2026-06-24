resource "google_cloud_run_service" "c" {
  name = "c"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = "projects/my-gcp-project/locations/australia-southeast1/connectors/prod-vpc-connector"
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
