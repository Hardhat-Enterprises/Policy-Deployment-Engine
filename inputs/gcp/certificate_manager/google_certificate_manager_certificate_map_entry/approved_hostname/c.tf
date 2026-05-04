resource "google_certificate_manager_certificate" "c" {
  name = "c-map"

  managed {
    domains = ["secure.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "c_map" {
  name = "c"
}

resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c-certificate-map-entry-hostname"
  description  = "Compliant certificate map entry using an approved hostname"
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "secure.example.com"
}