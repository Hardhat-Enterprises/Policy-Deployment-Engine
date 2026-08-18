resource "google_certificate_manager_certificate_map" "compliant_example_1" {
  project     = "sit764-cert-mgr-test"
  name        = "compliant_example_1"
  description = "Compliant certificate map using an approved environment label."

  labels = {
    environment = "prod"
  }
}
