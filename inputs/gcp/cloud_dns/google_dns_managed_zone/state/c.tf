resource "google_dns_managed_zone" "c" {
  name     = "c"
  dns_name = "c.example.com."
  project  = "demo-project"

  dnssec_config {
    state = "on"
  }
}