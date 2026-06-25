resource "google_scc_organization_custom_module" "compliant_example_1" {
  organization = "123456789"
  display_name = "compliant_example_1"
  enablement_state = "ENABLED"
  custom_config {
    predicate {
      expression = "resource.rotationPeriod > duration(\"2592000s\")"
    }
    resource_selector {
      resource_types = [
        "cloudkms.googleapis.com/CryptoKey",
      ]
    }
    description = "The rotation period of the identified cryptokey resource exceeds 30 days."
    recommendation = "Set the rotation period to at most 30 days."
    severity = "MEDIUM"
  }
}
