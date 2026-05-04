resource "google_certificate_manager_certificate" "c_certificate_location" {
  name        = "c-certificate-location"
  description = "Compliant certificate using the approved global location."
  location    = "global"

  managed {
    domains = [
      "c-certificate-location.example.com"
    ]
  }
}