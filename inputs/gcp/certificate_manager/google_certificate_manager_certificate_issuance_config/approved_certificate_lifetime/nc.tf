resource "google_certificate_manager_certificate_issuance_config" "nc_certificate_issuance_config_lifetime" {
  name        = "nc-certificate-issuance-config-lifetime"
  description = "Non-compliant certificate issuance config lifetime"
  location    = "us-central1"

  key_algorithm              = "ECDSA_P256"
  lifetime                   = "2592000s"
  rotation_window_percentage = 34

  certificate_authority_config {
    certificate_authority_service_config {
      ca_pool = "projects/test-project/locations/us-central1/caPools/test-ca-pool"
    }
  }
}