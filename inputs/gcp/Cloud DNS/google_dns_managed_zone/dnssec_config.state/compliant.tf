resource "google_dns_managed_zone" "compliant_example_1" {
  name     = "compliant_example_1"
  dns_name = "c.example.com."
  project  = "demo-project"

  dnssec_config {
    state = "on"
  }
}
