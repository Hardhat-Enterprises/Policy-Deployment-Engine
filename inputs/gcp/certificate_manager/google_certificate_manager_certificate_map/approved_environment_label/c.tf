resource "google_certificate_manager_certificate_map" "c_certificate_map_label" {
  name        = "c-certificate-map-label"
  description = "Compliant certificate map using an approved environment label."

  labels = {
    environment = "prod"
  }
}