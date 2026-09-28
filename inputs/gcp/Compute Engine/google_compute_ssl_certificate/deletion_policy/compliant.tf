resource "google_compute_ssl_certificate" "compliant_example_1" {
  name                    = "compliant-ssl-cert-1"
  deletion_policy         = "PREVENT"
  certificate             = <<EOT
-----BEGIN CERTIFICATE-----
distinct-real-certificate-content
-----END CERTIFICATE-----
EOT
  private_key_wo          = "approved-key-reference"
  private_key_wo_version  = "1"
}
