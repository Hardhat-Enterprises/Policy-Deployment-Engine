resource "google_certificate_manager_dns_authorization" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "sit764-policy-project"
  description = "Compliant DNS authorization using an approved domain"
  domain      = "example.com"
  type        = "PER_PROJECT_RECORD"

  labels = {
    environment = "prod"
  }
}
