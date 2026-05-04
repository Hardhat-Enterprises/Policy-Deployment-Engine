resource "google_certificate_manager_dns_authorization" "c_dns_authorization_domain" {
  name        = "c-dns-authorization-domain"
  description = "Compliant DNS authorization using an approved domain"
  domain      = "example.com"
  type        = "PER_PROJECT_RECORD"

  labels = {
    environment = "prod"
  }
}