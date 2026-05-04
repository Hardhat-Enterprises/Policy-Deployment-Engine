resource "google_certificate_manager_certificate" "c" {
  name        = "c"
  description = "Compliant certificate using the approved global location."
  location    = "global"

  managed {
    domains = [
      "c-certificate-location.example.com"
    ]
  }
}