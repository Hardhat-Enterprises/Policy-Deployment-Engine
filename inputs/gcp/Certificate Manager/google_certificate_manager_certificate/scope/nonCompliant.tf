resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  description = "Compliant certificate using the approved certificate scope."
  project     = "test-project"
  location    = "global"
  scope       = "EDGE_CACHE"

  managed {
    domains = ["scope-pass.example.com"]
  }
}
