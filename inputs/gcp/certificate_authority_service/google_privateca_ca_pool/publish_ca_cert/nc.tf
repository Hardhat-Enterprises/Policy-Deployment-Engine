resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = false
    publish_crl     = true
  }
}
