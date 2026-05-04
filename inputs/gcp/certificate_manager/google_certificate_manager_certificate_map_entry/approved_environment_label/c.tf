resource "google_certificate_manager_certificate_map" "c_map" {
  name        = "c-entry-env-map"
  description = "Compliant certificate map for approved environment label entry test."
}

resource "google_certificate_manager_certificate" "c_certificate" {
  name        = "c-entry-env-certificate"
  description = "Compliant certificate for approved environment label entry test."

  managed {
    domains = ["secure.example.com"]
  }
}

resource "google_certificate_manager_certificate_map_entry" "c_certificate_map_entry" {
  name        = "c-certificate-map-entry-env"
  description = "Compliant certificate map entry with approved environment label."
  map         = google_certificate_manager_certificate_map.c_map.name

  certificates = [
    google_certificate_manager_certificate.c_certificate.id
  ]

  hostname = "secure.example.com"

  labels = {
    environment = "production"
  }
}