resource "google_certificate_manager_certificate_map_entry" "c_certificate_map_entry" {
  name         = "c-certificate-map-entry"
  map          = google_certificate_manager_certificate_map.default.name
  certificates = [google_certificate_manager_certificate.default.id]
  hostname     = "www.example.com"
}