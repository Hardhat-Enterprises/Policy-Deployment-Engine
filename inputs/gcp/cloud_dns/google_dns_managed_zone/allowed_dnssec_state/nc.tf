resource "google_dns_managed_zone" "nc" {
  name     = "nc"
  dns_name = "nc.example.com."
  project  = "demo-project"

  dnssec_config {
    state = "off"
  }
}