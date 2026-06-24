resource "google_certificate_manager_certificate_map" "nc" {
  project     = "sit764-cert-mgr-test"
  name        = "nc"
  description = "Non-compliant certificate map using a non-approved environment label."

  labels = {
    environment = "test"
  }
}