resource "google_dns_record_set" "non_compliant_example_1" {
  name         = "nc.mydomain.com."
  managed_zone = "non_compliant_example_1"
  type         = "A"
  ttl          = 60
  rrdatas      = ["8.8.8.8"]
}
