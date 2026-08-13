resource "google_compute_ssl_certificate" "non_compliant_example_1" {
  name                    = "noncompliant-ssl-cert-1"
  deletion_policy         = "PREVENT"
  certificate             = <<EOT
-----BEGIN CERTIFICATE-----
dummy-certificate-content
-----END CERTIFICATE-----
EOT
  private_key_wo          = "approved-key-reference"
  private_key_wo_version  = "1"
}
