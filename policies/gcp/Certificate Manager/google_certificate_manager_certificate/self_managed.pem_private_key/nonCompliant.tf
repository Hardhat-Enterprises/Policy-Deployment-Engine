resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
  project = "sit764-policy-project"

  self_managed {
    pem_certificate = <<EOT
-----BEGIN CERTIFICATE-----
dummy-certificate-content
-----END CERTIFICATE-----
EOT

    pem_private_key = <<EOT
-----BEGIN PRIVATE KEY-----
dummy-private-key-content
-----END PRIVATE KEY-----
EOT
  }
}
