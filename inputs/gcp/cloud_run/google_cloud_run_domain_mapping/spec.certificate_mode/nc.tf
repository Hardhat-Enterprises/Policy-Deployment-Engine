resource "google_cloud_run_service" "nc" {
 project = "my-gcp-project"
  name = "nc"
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
   project = "wrong-project-id" 
   location = "us-west1"
   name = "nc"

  metadata {
    namespace = "my-project-name"
  }

  spec {
    route_name = google_cloud_run_service.nc.name
    certificate_mode = "NONE"
  }
}
