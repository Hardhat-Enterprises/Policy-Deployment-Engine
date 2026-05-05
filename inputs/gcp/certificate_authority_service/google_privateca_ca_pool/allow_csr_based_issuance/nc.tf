resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl     = true
  }
  issuance_policy {
    allowed_issuance_modes {
      allow_csr_based_issuance    = false
      allow_config_based_issuance = true
    }
    maximum_lifetime = "315360000s"
  }
}
