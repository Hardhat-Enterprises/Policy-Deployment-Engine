resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl     = true
  }
}
