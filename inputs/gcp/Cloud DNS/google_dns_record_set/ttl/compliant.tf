resource "google_dns_record_set" "compliant_example_1" {
  name         = "c.mydomain.com."
  managed_zone = "compliant_example_1"
  type         = "A"
  ttl          = 300
  rrdatas      = ["8.8.8.8"]
}
