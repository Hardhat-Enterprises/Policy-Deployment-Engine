# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_scc_project_custom_module" "c" {
  project = "cefwed"
  display_name = "enablement_state"
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
    severity = "LOW"
    recommendation = "Steps to resolve violation"
  }
}
