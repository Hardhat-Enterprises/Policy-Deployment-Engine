resource "google_compute_ssl_certificate" "non_compliant_example_1" {
  name             = "noncompliant-ssl-cert-1"
  deletion_policy  = "PREVENT"
  certificate      = <<EOT
-----BEGIN CERTIFICATE-----
distinct-real-certificate-content
-----END CERTIFICATE-----
EOT
  private_key      = <<EOT
-----BEGIN PRIVATE KEY-----
dummy-private-key-content
-----END PRIVATE KEY-----
EOT
}
