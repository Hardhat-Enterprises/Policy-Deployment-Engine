# application block
resource "google_apphub_application" "application-nc" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "online-shop-nc"
  scope {
    type = "REGIONAL"
  }
}

# checkout service
resource "google_compute_region_backend_service" "backend-nc" {
  project = "PDE"
  name    = "backend-nc"
  region  = "australia-southeast1"
}

resource "google_apphub_service" "nc1" {
  project            = "PDE"
  display_name       = "AppHub Service nc1"
  location           = "australia-southeast1"
  application_id     = google_apphub_application.application-nc.application_id
  service_id         = google_compute_region_backend_service.backend-nc.name
  discovered_service = "atalog-service-path"
  attributes {}
}

resource "google_apphub_service" "nc2" {
  project            = "PDE"
  display_name       = "AppHub Service nc2"
  location           = "australia-southeast1"
  application_id     = google_apphub_application.application-nc.application_id
  service_id         = google_compute_region_backend_service.backend-nc.name
  discovered_service = "atalog-service-path"
}
