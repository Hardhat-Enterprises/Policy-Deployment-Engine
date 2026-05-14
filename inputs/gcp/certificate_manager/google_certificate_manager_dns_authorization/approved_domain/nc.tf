resource "google_certificate_manager_dns_authorization" "nc" {
  name        = "nc"
  project     = "sit764-policy-project"
  description = "Non-compliant DNS authorization using a non-approved domain"
  domain      = "unapproved-example.net"
  type        = "PER_PROJECT_RECORD"

  labels = {
    environment = "prod"
  }
}