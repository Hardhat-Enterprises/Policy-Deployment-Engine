resource "google_dns_managed_zone" "prod" {
  name     = "c"
  dns_name = "c.mydomain.com."
}

resource "google_dns_record_set" "c" {
  name         = "c.mydomain.com."
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300
  rrdatas      = ["8.8.8.8"]
}