resource "google_certificate_manager_certificate" "c" {
  project = "sit764-policy-project"
  name        = "c"
  description = "Compliant certificate using an approved Australian location."
  location    = "australia-southeast1"

  managed {
    domains = [
      "c-certificate-location.example.com"
    ]
  }
}