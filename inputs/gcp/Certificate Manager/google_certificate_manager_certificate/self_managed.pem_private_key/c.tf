resource "google_certificate_manager_certificate" "c" {
  name    = "c"
  project = "sit764-policy-project"

  managed {
    domains = ["example.com"]
  }
}