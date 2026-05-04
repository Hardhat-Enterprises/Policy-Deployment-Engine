resource "google_certificate_manager_certificate" "c" {
  name        = "c"
  description = "Compliant certificate using the approved certificate scope."
  project     = "test-project"
  location    = "global"
  scope       = "DEFAULT"

  managed {
    domains = ["scope-pass.example.com"]
  }
}