resource "google_compute_target_ssl_proxy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  backend_service = "projects/*/global/backendServices/*"

  ssl_certificates = [
    "projects/*/global/sslCertificates/*"
  ]

  deletion_policy = "ABANDON"
}
