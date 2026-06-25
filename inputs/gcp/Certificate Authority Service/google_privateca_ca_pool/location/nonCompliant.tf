resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl     = true
  }
}
