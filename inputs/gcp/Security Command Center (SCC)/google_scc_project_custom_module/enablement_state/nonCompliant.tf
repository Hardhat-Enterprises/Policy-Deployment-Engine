resource "google_scc_project_custom_module" "non_compliant_example_1" {
  project = "cefwed"
  display_name = "non_compliant_example_1"
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
    severity = "LOW"
    recommendation = "Steps to resolve violation"
  }
}
