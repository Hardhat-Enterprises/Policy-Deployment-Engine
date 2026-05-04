resource "google_certificate_manager_certificate" "nc_certificate_location" {
  name        = "nc-certificate-location"
  description = "Non-compliant certificate using a non-approved regional location."
  location    = "us-central1"

  managed {
    domains = [
      "nc-certificate-location.example.com"
    ]
  }
}