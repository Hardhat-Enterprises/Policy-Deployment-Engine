resource "google_certificate_manager_dns_authorization" "nc_dns_authorization" {
  name        = "nc-dns-authorization"
  description = "Non-compliant DNS authorization"
  domain      = "example.org"
  location    = "us-central1"

  type = "FIXED_RECORD"
}