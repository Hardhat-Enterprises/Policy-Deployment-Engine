resource "google_compute_target_ssl_proxy" "compliant_example_1" {
  name            = "compliant-example-1"
  backend_service = "projects/*/global/backendServices/*"

  ssl_certificates = [
    "projects/*/global/sslCertificates/*"
  ]

  ssl_policy = "projects/*/global/sslPolicies/*"
}
