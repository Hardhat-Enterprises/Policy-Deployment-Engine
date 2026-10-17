resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl     = true
  }
  issuance_policy {
    maximum_lifetime = "999999999s"
    allowed_issuance_modes {
      allow_csr_based_issuance    = true
      allow_config_based_issuance = true
    }
  }
}
