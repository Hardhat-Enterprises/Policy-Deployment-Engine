resource "google_dns_managed_zone" "non_compliant_example_1" {
  name       = "non_compliant_example_1"
  dns_name   = "c.example.com."
  visibility = "public"
}
