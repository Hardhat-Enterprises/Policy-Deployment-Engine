resource "google_certificate_manager_trust_config" "nc" {
  name        = "nc"
  project     = "sit764-policy-project"
  location    = "global"
  description = "Non-compliant trust config with allowlisted certificate"

  allowlisted_certificates {
    pem_certificate = <<EOT
-----BEGIN CERTIFICATE-----
dummy-certificate-content
-----END CERTIFICATE-----
EOT
  }
}