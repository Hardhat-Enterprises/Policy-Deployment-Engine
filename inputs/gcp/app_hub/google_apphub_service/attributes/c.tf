# application block
resource "google_apphub_application" "application-c" {
  project = "PDE"
  location = "us-central1"
  application_id = "online-shop-1"
  scope {
    type = "REGIONAL"
  }
}

# checkout service
resource "google_compute_region_backend_service" "backend-c" {
  project = "PDE"
  name = "backend-1"
  region = "us-central1"
}

resource "google_apphub_service" "c" {
  project = "PDE"
  display_name = "AppHub Service c"
  location = "us-central1"
  application_id = google_apphub_application.application-c.application_id
  service_id = google_compute_region_backend_service.backend-c.name
  discovered_service = "catalog-discorvered-service-path"
  attributes {
    environment {
      type = "STAGING"
    }
    criticality {  
        type = "MISSION_CRITICAL"
    }
  }
}
