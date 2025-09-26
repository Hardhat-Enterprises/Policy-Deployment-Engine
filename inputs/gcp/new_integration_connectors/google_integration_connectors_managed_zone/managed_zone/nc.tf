resource "google_dns_managed_zone" "zone-nc" {
  name        = "test"
  project     = "PDE_managedZone"
  dns_name    = "private.example.com."
  visibility  = "public"

}