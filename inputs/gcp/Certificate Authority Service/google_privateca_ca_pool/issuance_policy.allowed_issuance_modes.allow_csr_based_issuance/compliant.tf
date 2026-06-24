resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  issuance_policy {
    allowed_issuance_modes {
      allow_csr_based_issuance    = true
      allow_config_based_issuance = true
    }
  }
}
