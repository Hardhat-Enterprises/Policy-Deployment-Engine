resource "google_cloud_run_service" "c" {
  project  = "my-gcp-project"
  name     = "cloudrun-srv"
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
  name     = "verified-domain.com"

  metadata {
    namespace = "my-project-name"

    annotations = {
      ticket = "SEC-123"
    }
  }

  spec {
    route_name = google_cloud_run_service.c.name
  }
}