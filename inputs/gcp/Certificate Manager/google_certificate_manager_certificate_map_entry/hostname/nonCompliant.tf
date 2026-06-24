resource "google_certificate_manager_certificate" "nc_certificate" {
  name    = "nc-certificate"
  project = "sit764-policy-project"

  managed {
    domains = ["unapproved.example.net"]
  }
}

resource "google_certificate_manager_certificate_map" "nc_map" {
  name    = "nc-map"
  project = "sit764-policy-project"
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name         = "nc"
  project      = "sit764-policy-project"
  description  = "Non-compliant certificate map entry using a non-approved hostname."
  map          = google_certificate_manager_certificate_map.nc_map.name
  certificates = [google_certificate_manager_certificate.nc_certificate.id]
  hostname     = "unapproved.example.net"
}