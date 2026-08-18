resource "google_certificate_manager_trust_config" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
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
