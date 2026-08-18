resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  description = "Non-compliant certificate using a non-approved certificate scope."
  project     = "test-project"
  location    = "global"
  scope       = "EDGE_CACHE"

  managed {
    domains = ["scope-fail.example.com"]
  }
}
