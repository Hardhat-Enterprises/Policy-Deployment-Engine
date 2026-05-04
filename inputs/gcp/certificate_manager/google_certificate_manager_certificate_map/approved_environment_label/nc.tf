resource "google_certificate_manager_certificate_map" "nc_certificate_map_label" {
  name        = "nc-certificate-map-label"
  description = "Non-compliant certificate map using a non-approved environment label."

  labels = {
    environment = "test"
  }
}