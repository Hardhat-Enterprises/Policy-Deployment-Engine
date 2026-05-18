resource "google_certificate_manager_certificate_map" "nc_map" {
  name        = "nc-map"
  project     = "sit764-policy-project"
  description = "Non-compliant certificate map for approved matcher test."
}

resource "google_certificate_manager_certificate" "nc_certificate" {
  name        = "nc-certificate"
  project     = "sit764-policy-project"
  description = "Non-compliant certificate for approved matcher test."

  managed {
    domains = ["primary.example.com"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc"
  project      = "sit764-policy-project"
  description  = "Non-compliant certificate map entry using a non-approved matcher value."
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  matcher      = "DEFAULT"
}