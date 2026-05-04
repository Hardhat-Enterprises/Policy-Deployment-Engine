resource "google_certificate_manager_dns_authorization" "c" {
  name        = "c"
  description = "Compliant DNS authorization"
  domain      = "example.com"
  location    = "us-central1"

  type = "PER_PROJECT_RECORD"
}