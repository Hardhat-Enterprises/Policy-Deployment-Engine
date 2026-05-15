resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  issuance_policy {
    allowed_issuance_modes {
      allow_csr_based_issuance    = false
      allow_config_based_issuance = true
    }
  }
}
