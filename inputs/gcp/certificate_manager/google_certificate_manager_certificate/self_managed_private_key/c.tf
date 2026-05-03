resource "google_certificate_manager_certificate" "c" {
  name = "c-certificate"

  managed {
    domains = ["example.com"]
  }
}