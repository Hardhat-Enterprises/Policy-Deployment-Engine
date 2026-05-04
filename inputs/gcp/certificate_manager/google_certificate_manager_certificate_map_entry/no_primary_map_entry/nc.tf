resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc-map"
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.default.id]
  matcher      = "PRIMARY"
}