resource "google_certificate_manager_dns_authorization" "nc_dns_authorization_domain" {
  name        = "nc-dns-authorization-domain"
  description = "Non-compliant DNS authorization using a non-approved domain"
  domain      = "unapproved-example.net"
  type        = "PER_PROJECT_RECORD"

  labels = {
    environment = "prod"
  }
}