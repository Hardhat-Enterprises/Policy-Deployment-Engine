# application block
resource "google_apphub_application" "application-nc" {
  project = "PDE"
  location = "us-central1"
  application_id = "online-shop-1"
  scope {
    type = "REGIONAL"
  }
}

# checkout service
resource "google_compute_region_backend_service" "backend-nc" {
  project = "PDE"
  name = "backend-1"
  region = "us-central1"
}

resource "google_apphub_service" "nc1" {
  project = "PDE"
  display_name = "AppHub Service nc1"
  location = "us-central1"
  application_id = google_apphub_application.application-nc.application_id
  service_id = google_compute_region_backend_service.backend-nc.name
  discovered_service = "atalog-service-path"
  attributes {}
}

resource "google_apphub_service" "nc2" {
  project = "PDE"
  display_name = "AppHub Service nc2"
  location = "us-central1"
  application_id = google_apphub_application.application-nc.application_id
  service_id = google_compute_region_backend_service.backend-nc.name
  discovered_service = "atalog-service-path"
}
