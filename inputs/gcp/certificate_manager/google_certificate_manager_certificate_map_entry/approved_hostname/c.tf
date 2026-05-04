resource "google_certificate_manager_certificate" "c_certificate" {
  name = "c-approved-hostname-cert"

  managed {
    domains = ["secure.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "c_certificate_map" {
  name = "c-approved-hostname-map"
}

resource "google_certificate_manager_certificate_map_entry" "c_certificate_map_entry" {
  name         = "c-certificate-map-entry-hostname"
  description  = "Compliant certificate map entry using an approved hostname"
  map          = google_certificate_manager_certificate_map.c_certificate_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "secure.example.com"
}