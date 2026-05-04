resource "google_certificate_manager_certificate" "nc" {
  name = "nc-map"

  managed {
    domains = ["unapproved.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "nc_map" {
  name = "nc"
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc-certificate-map-entry-hostname"
  description  = "Non-compliant certificate map entry using an unapproved hostname"
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  hostname     = "unapproved.example.com"
}