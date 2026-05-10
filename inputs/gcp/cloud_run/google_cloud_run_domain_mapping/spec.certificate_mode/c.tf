resource "google_cloud_run_service" "c" {
  project  = "my-gcp-project"
  name = "c"
  location = "us-central1"

  metadata {
    namespace = "my-project-name"
  }

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }
}

resource "google_cloud_run_domain_mapping" "c" {
  project  = "my-gcp-project"
  location = "us-central1"
  name = "c"

  metadata {
    namespace = "my-project-name"
  }

  spec {
    route_name = google_cloud_run_service.c.name
    certificate_mode = "AUTOMATIC"
  }
}
