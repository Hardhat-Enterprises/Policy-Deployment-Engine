resource "google_certificate_manager_certificate" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "sit764-policy-project"

  managed {
    domains = ["example.com"]
  }
}
