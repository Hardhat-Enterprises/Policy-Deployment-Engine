resource "google_certificate_manager_certificate_map" "c_map" {
  name        = "c-map"
  project     = "sit764-policy-project"
  description = "Compliant certificate map for approved matcher test."
}

resource "google_certificate_manager_certificate" "c_certificate" {
  name        = "c-certificate"
  project     = "sit764-policy-project"
  description = "Compliant certificate for approved matcher test."

  managed {
    domains = ["www.example.com"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c"
  project      = "sit764-policy-project"
  description  = "Compliant certificate map entry using an approved matcher configuration."
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "www.example.com"
}