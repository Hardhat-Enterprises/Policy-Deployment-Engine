# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_folder" "folder_nc" {
  parent       = "organizations/123456789"
  display_name = "folder-name"
  deletion_protection = false
}

resource "google_scc_folder_custom_module" "nc" {
  folder = google_folder.folder_nc.folder_id
  display_name = "enablement_state"
  enablement_state = "DISABLED"
  custom_config {
    predicate {
      expression = "resource.rotationPeriod > duration(\"2592000s\")"
      title = "Purpose of the expression"
      description = "description of the expression"
      location = "location of the expression"
    }
    custom_output {
      properties {
        name = "duration"
        value_expression {
          expression = "resource.rotationPeriod"
          title = "Purpose of the expression"
          description = "description of the expression"
          location = "location of the expression"
        }
      }
    }
    resource_selector {
      resource_types = [
        "cloudkms.googleapis.com/CryptoKey",
      ]
    }
    severity = "LOW"
    description = "Description of the custom module"
    recommendation = "Steps to resolve violation"
  }
}
