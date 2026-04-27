resource "google_dns_managed_zone" "nc" {
  name        = "example-zone"
  dns_name    = "example.com."
  description = "Example DNS zone"

  labels = {
    foo = "bar"
  }

  # visibility not set = defaults to "public" = POLICY FAIL
}