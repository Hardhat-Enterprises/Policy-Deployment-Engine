resource "google_certificate_manager_dns_authorization" "nc" {
  name        = "nc"
  description = "Non-compliant DNS authorization"
  domain      = "example.org"
  location    = "us-central1"

  type = "FIXED_RECORD"
}