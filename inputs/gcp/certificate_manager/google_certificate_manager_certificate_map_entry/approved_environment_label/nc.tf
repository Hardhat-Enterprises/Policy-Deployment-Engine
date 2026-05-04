resource "google_certificate_manager_certificate_map" "nc_map" {
  name        = "nc-map"
  description = "Non-compliant certificate map for approved environment label entry test."
}

resource "google_certificate_manager_certificate" "nc_certificate" {
  name        = "nc-certificate"
  description = "Non-compliant certificate for approved environment label entry test."

  managed {
    domains = ["unapproved.example.net"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "nc" {
  name        = "nc"
  description = "Non-compliant certificate map entry with non-approved environment label."
  map         = google_certificate_manager_certificate_map.nc_map.name

  certificates = [
    google_certificate_manager_certificate.nc_certificate.id
  ]

  hostname = "unapproved.example.net"

  labels = {
    environment = "development"
  }
}
