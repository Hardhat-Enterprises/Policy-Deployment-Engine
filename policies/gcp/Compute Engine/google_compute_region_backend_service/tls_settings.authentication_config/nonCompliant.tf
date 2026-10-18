# google_compute_region_backend_service: tls_settings.authentication_config
# Non-compliant when backend TLS settings are used without an authentication config.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name     = "non-compliant-example-1"
  protocol = "HTTPS"

  tls_settings {
    sni = "backend.example.com"
  }
}
