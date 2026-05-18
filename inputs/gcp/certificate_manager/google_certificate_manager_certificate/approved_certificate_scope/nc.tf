resource "google_certificate_manager_certificate" "nc" {
  name        = "nc"
  description = "Non-compliant certificate using a non-approved certificate scope."
  project     = "test-project"
  location    = "global"
  scope       = "EDGE_CACHE"

  managed {
    domains = ["scope-fail.example.com"]
  }
}