resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
  location = "us-central1"
  tier     = "ENTERPRISE"
  publishing_options {
    publish_ca_cert = true
    publish_crl     = true
  }
}
