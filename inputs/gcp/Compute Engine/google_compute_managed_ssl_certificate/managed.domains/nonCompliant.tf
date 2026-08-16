resource "google_compute_managed_ssl_certificate" "non_compliant_example_1" {
  name = "noncompliant-cert"

  managed {
    domains = ["untrusted.example.com."]
  }
}
