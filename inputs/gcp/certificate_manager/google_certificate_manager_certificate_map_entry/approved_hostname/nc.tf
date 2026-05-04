resource "google_certificate_manager_certificate" "nc_certificate" {
  name = "nc-certificate"

  managed {
    domains = ["unapproved.example.net"]
  }
}

resource "google_certificate_manager_certificate_map" "nc_map" {
  name = "nc-map"
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc"
  description  = "Non-compliant certificate map entry using a non-approved hostname."
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  hostname     = "unapproved.example.net"
}
