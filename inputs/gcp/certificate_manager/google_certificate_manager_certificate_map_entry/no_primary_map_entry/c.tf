resource "google_certificate_manager_certificate_map_entry" "c" {
  name         = "c-map"
  map          = google_certificate_manager_certificate_map.c_map.name
  certificates = [google_certificate_manager_certificate.default.id]
  hostname     = "www.example.com"
}