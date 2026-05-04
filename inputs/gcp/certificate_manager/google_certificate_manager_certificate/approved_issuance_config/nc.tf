resource "google_certificate_manager_certificate" "nc_certificate_issuance_config" {
  name        = "nc-certificate-issuance-config"
  description = "Non-compliant certificate using a non-approved certificate issuance config."
  location    = "global"

  managed {
    domains = [
      "nc-certificate-issuance-config.example.com"
    ]

    issuance_config = "projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/unapproved-issuance-config"
  }
}