resource "google_dns_managed_zone" "prod_nc" {
  name     = "nc"
  dns_name = "nc.mydomain.com."
}

resource "google_dns_record_set" "nc" {
  name         = "nc.mydomain.com."
  managed_zone = google_dns_managed_zone.prod_nc.name
  type         = "A"
  ttl          = 60
  rrdatas      = ["8.8.8.8"]
}