resource "google_scc_project_custom_module" "nc" {
  project          = "cefwed"
  display_name     = "nc"
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
    severity       = "LOW"
    recommendation = "Steps to resolve violation"
  }
}
