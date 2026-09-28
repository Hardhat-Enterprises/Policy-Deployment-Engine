# google_compute_region_backend_service: tls_settings.authentication_config
# Compliant when backend TLS settings reference an authentication config.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name     = "compliant-example-1"
  protocol = "HTTPS"

  tls_settings {
    sni                   = "backend.example.com"
    authentication_config = "projects/fake-project/locations/australia-southeast1/backendAuthenticationConfigs/fake-config"
  }
}
