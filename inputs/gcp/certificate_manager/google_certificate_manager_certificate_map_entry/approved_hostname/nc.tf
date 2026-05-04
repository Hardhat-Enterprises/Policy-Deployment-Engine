resource "google_certificate_manager_certificate" "nc_certificate" {
  name = "nc-approved-hostname-cert"

  managed {
    domains = ["unapproved.example.com"]
  }
}

resource "google_certificate_manager_certificate_map" "nc_certificate_map" {
  name = "nc-approved-hostname-map"
}

resource "google_certificate_manager_certificate_map_entry" "nc_certificate_map_entry" {
  name         = "nc-certificate-map-entry-hostname"
  description  = "Non-compliant certificate map entry using an unapproved hostname"
  map          = google_certificate_manager_certificate_map.nc_certificate_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  hostname     = "unapproved.example.com"
}