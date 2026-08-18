resource "google_certificate_manager_certificate" "compliant_example_1" {
  name        = "compliant_example_1"
  description = "Compliant certificate using the approved certificate scope."
  project     = "test-project"
  location    = "global"
  scope       = "DEFAULT"

  managed {
    domains = ["scope-pass.example.com"]
  }
}
