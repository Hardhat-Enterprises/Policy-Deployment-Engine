resource "google_certificate_manager_certificate" "c" {
  name        = "c"
  description = "Compliant certificate using an approved certificate issuance config."
  location    = "global"

  managed {
    domains = [
      "c-certificate-issuance-config.example.com"
    ]

    issuance_config = "projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/approved-issuance-config"
  }
}