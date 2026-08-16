resource "google_compute_managed_ssl_certificate" "compliant_example_1" {
  name = "compliant-cert"

  managed {
    domains = ["approved.example.com."]
  }
}
