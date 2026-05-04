resource "google_certificate_manager_certificate" "c" {
  name = "c"

  managed {
    domains = ["example.com"]
  }
}