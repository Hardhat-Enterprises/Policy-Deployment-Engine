resource "google_certificate_manager_certificate" "c_certificate" {
  name    = "c-certificate"
  project = "sit764-policy-project"

  managed {
    domains = ["secure.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "c_map" {
  name    = "c-map"
  project = "sit764-policy-project"
}

resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c"
  project      = "sit764-policy-project"
  description  = "Compliant certificate map entry using an approved hostname."
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "secure.example.com"
}