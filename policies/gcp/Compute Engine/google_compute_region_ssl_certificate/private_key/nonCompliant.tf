resource "google_compute_region_ssl_certificate" "non_compliant_example_1" {
  name            = "noncompliant-cert-1"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
  certificate     = <<EOT
-----BEGIN CERTIFICATE-----
distinct-real-certificate-content
-----END CERTIFICATE-----
EOT
  private_key     = <<EOT
-----BEGIN PRIVATE KEY-----
dummy-private-key-content
-----END PRIVATE KEY-----
EOT
}
