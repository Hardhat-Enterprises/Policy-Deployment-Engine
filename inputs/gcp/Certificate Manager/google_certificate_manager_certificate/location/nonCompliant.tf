resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  project = "sit764-policy-project"
  name        = "non_compliant_example_1"
  description = "Non-compliant certificate using a non-approved regional location."
  location    = "us-central1"

  managed {
    domains = [
      "nc-certificate-location.example.com"
    ]
  }
}
