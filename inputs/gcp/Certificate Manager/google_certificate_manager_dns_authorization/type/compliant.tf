resource "google_certificate_manager_dns_authorization" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "sit764-policy-project"
  description = "Compliant DNS authorization"
  domain      = "example.com"
  location    = "us-central1"

  type = "PER_PROJECT_RECORD"
}
