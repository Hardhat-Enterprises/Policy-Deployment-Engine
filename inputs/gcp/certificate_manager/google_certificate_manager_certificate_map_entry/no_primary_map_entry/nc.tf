resource "google_certificate_manager_certificate_map" "nc_map" {
  name        = "nc-map"
  description = "Non-compliant certificate map for primary map entry test."
}

resource "google_certificate_manager_certificate" "nc_certificate" {
  name        = "nc-certificate"
  description = "Non-compliant certificate for primary map entry test."

  managed {
    domains = ["primary.example.com"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc"
  description  = "Non-compliant certificate map entry using PRIMARY matcher."
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  matcher      = "PRIMARY"
}
