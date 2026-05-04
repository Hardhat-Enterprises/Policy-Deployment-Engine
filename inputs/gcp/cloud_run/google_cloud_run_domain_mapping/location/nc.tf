resource "google_cloud_run_service" "nc" {
 project = "my-gcp-project"
  name     = "cloudrun-srv"
  location = "us-central"

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

resource "google_cloud_run_domain_mapping" "nc" {
   project = "my-gcp-project"
   location = "us-west1"
   name     = "verified-domain.com"

  metadata {
    namespace = "my-project-name"
    
  }

  spec {
    route_name = google_cloud_run_service.nc.name
  }
}