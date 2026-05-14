resource "google_dns_managed_zone" "c" {
  name       = "c"
  dns_name   = "c.example.com."
  visibility = "private"
}