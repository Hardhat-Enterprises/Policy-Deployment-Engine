resource "google_certificate_manager_certificate" "non_compliant_example_1" {
  project     = "sit764-policy-project"
  name        = "non_compliant_example_1"
  description = "Non-compliant certificate using a non-approved certificate issuance config."
  location    = "global"

  managed {
    domains = [
      "nc-certificate-issuance-config.example.com"
    ]

    issuance_config = "projects/sit764-policy-project/locations/global/certificateIssuanceConfigs/unapproved-issuance-config"
  }
}
