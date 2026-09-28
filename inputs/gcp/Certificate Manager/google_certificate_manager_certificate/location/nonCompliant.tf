resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  project = "sit764-policy-project"
  name        = "non_compliant_example_1"
  description = "Compliant certificate using an approved Australian location."
  location    = "us-central1"

  managed {
    domains = [
      "c-certificate-location.example.com"
    ]
  }
}
