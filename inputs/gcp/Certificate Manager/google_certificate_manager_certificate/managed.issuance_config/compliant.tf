resource "google_certificate_manager_certificate" "compliant_example_1" {
  project     = "sit764-policy-project"
  name        = "compliant_example_1"
  description = "Compliant certificate using an approved certificate issuance config."
  location    = "global"

  managed {
    domains = [
      "c-certificate-issuance-config.example.com"
    ]

    issuance_config = "projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/approved-issuance-config"
  }
}
