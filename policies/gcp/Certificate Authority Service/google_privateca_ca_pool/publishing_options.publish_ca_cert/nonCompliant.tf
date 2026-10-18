resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = false
    publish_crl     = true
  }
}
