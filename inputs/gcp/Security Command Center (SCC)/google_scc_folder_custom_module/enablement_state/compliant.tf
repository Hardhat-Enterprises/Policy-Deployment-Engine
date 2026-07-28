resource "google_scc_folder_custom_module" "compliant_example_1" {
  folder          = "folders/123456789"
  display_name    = "compliant_example_1"
  enablement_state = "ENABLED"

  custom_config {
    predicate {
      expression   = "resource.rotationPeriod > duration(\"2592000s\")"
      title        = "Purpose of the expression"
      description  = "description of the expression"
      location     = "location of the expression"
    }
    custom_output {
      properties {
        name = "duration"
        value_expression {
          expression   = "resource.rotationPeriod"
          title        = "Purpose of the expression"
          description  = "description of the expression"
          location     = "location of the expression"
        }
      }
    }
    resource_selector {
      resource_types = [
        "cloudkms.googleapis.com/CryptoKey",
      ]
    }
    severity       = "LOW"
    description    = "Description of the custom module"
    recommendation = "Steps to resolve violation"
  }
}
