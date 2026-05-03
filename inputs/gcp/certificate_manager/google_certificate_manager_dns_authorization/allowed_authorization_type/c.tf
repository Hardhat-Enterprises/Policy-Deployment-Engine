resource "google_certificate_manager_dns_authorization" "c_dns_authorization" {
  name        = "c-dns-authorization"
  description = "Compliant DNS authorization"
  domain      = "example.com"
  location    = "us-central1"

  type = "PER_PROJECT_RECORD"
}