resource "google_dns_managed_zone" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  dns_name = "nc.example.com."
  project  = "demo-project"

  dnssec_config {
    state = "off"
  }
}
