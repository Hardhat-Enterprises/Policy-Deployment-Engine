resource "google_certificate_manager_certificate" "nc" {
  name    = "nc"
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