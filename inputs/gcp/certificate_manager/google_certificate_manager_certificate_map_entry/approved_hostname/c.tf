resource "google_certificate_manager_certificate" "c_certificate" {
  name = "c-certificate"

  managed {
    domains = ["secure.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "c_map" {
  name = "c-map"
}

resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c"
  description  = "Compliant certificate map entry using an approved hostname."
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "secure.example.com"
}
