resource "google_certificate_manager_certificate" "compliant_example_1" {
  project = "sit764-policy-project"
  name        = "compliant_example_1"
  description = "Compliant certificate using an approved Australian location."
  location    = "australia-southeast1"

  managed {
    domains = [
      "c-certificate-location.example.com"
    ]
  }
}
