resource "google_certificate_manager_dns_authorization" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "sit764-policy-project"
  description = "Non-compliant DNS authorization"
  domain      = "example.org"
  location    = "us-central1"

  type = ""
}
