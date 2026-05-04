resource "google_certificate_manager_certificate_issuance_config" "nc" {
  name        = "nc"
  description = "Non-compliant certificate issuance config using unapproved CA pool"
  location    = "global"

  certificate_authority_config {
    certificate_authority_service_config {
      ca_pool = "projects/sit764-policy-project/locations/us-central1/caPools/unapproved-ca-pool"
    }
  }

  lifetime                   = "1814400s"
  rotation_window_percentage = 34
  key_algorithm              = "ECDSA_P256"
}