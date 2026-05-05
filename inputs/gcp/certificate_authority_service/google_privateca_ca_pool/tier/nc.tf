resource "google_privateca_ca_pool" "nc" {
  name = "nc"
  location = "us-central1"
  tier = "DEVOPS"
  publishing_options {
    publish_ca_cert = true
    publish_crl = true
  }
  labels = {
    foo = "bar"
  }
}
