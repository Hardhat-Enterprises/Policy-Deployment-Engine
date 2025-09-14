# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_scc_organization_custom_module" "nc" {
  organization = "123456789"
  display_name = "enablement_state"
  enablement_state = "DISABLED"
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
