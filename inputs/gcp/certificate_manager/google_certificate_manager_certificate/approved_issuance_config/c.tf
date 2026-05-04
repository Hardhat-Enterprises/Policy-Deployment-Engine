resource "google_certificate_manager_certificate" "c_certificate_issuance_config" {
  name        = "c-certificate-issuance-config"
  description = "Compliant certificate using an approved certificate issuance config."
  location    = "global"

  managed {
    domains = [
      "c-certificate-issuance-config.example.com"
    ]

    issuance_config = "projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/approved-issuance-config"
  }
}