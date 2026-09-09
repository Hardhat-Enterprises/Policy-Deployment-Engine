resource "google_certificate_manager_certificate_issuance_config" "non_compliant_example_1" {
  project     = "sit764-policy-project"
  name        = "non_compliant_example_1"
  description = "Compliant certificate issuance config using approved CA pool"
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
