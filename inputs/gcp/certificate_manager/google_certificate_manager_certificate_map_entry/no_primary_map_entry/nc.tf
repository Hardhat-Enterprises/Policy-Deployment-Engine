resource "google_certificate_manager_certificate_map_entry" "nc_certificate_map_entry" {
  name         = "nc-certificate-map-entry"
  map          = google_certificate_manager_certificate_map.default.name
  certificates = [google_certificate_manager_certificate.default.id]
  matcher      = "PRIMARY"
}