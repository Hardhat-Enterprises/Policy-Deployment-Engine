resource "google_certificate_manager_certificate_issuance_config" "c_certificate_issuance_config_rotation" {
  name        = "c-certificate-issuance-config-rotation"
  description = "Compliant certificate issuance config rotation window"
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