resource "google_dns_managed_zone" "nc" {
  name       = "nc"
  dns_name   = "nc.example.com."
  visibility = "public"
}