resource "google_certificate_manager_certificate_map" "c_map" {
  name        = "c-map"
  description = "Compliant certificate map for non-primary map entry test."
}

resource "google_certificate_manager_certificate" "c_certificate" {
  name        = "c-certificate"
  description = "Compliant certificate for non-primary map entry test."

  managed {
    domains = ["www.example.com"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c"
  description  = "Compliant certificate map entry using a hostname instead of PRIMARY matcher."
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.c_certificate.id]
  hostname     = "www.example.com"
}
