resource "google_certificate_manager_certificate_map" "non_compliant_example_1" {
  project     = "sit764-cert-mgr-test"
  name        = "non_compliant_example_1"
  description = "Compliant certificate map using an approved environment label."

  labels = {
    environment = "test"
  }
}
