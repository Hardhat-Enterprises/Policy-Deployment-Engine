resource "google_certificate_manager_certificate_map" "nc" {
  name        = "nc"
  description = "Non-compliant certificate map using a non-approved environment label."

  labels = {
    environment = "test"
  }
}