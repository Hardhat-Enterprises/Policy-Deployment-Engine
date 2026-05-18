resource "google_certificate_manager_certificate" "nc" {
  project = "sit764-policy-project"
  name        = "nc"
  description = "Non-compliant certificate using a non-approved regional location."
  location    = "us-central1"

  managed {
    domains = [
      "nc-certificate-location.example.com"
    ]
  }
}