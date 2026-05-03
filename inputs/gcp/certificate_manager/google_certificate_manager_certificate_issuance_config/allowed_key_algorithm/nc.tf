resource "google_certificate_manager_certificate_issuance_config" "nc_certificate_issuance_config" {
  name        = "nc-certificate-issuance-config"
  description = "Non-compliant certificate issuance config"
  location    = "us-central1"

  key_algorithm              = "RSA_2048"
  lifetime                   = "1814400s"
  rotation_window_percentage = 34

  certificate_authority_config {
    certificate_authority_service_config {
      ca_pool = "projects/test-project/locations/us-central1/caPools/test-ca-pool"
    }
  }
}