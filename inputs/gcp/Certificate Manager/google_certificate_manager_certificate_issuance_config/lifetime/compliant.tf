resource "google_certificate_manager_certificate_issuance_config" "compliant_example_1" {
  project     = "test-project"
  name        = "compliant_example_1"
  description = "Compliant certificate issuance config lifetime"
  location    = "us-central1"

  key_algorithm              = "ECDSA_P256"
  lifetime                   = "1814400s"
  rotation_window_percentage = 34

  certificate_authority_config {
    certificate_authority_service_config {
      ca_pool = "projects/test-project/locations/us-central1/caPools/test-ca-pool"
    }
  }
}
