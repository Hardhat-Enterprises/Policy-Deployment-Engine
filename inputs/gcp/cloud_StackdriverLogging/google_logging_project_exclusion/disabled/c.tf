# Compliant: No disabled attribute (defaults to false)
resource "google_logging_project_exclusion" "c" {
  name        = "active-exclusion"
  project     = "my-project"
  description = "Active exclusion - COMPLIANT"

  filter = "resource.type = \"k8s_container\" AND jsonPayload.health_check = true"
}

# Compliant: Explicitly disabled = false
resource "google_logging_project_exclusion" "c2" {
  name        = "explicit-active"
  project     = "my-project"
  description = "Explicitly active exclusion - COMPLIANT"
  disabled    = false

  filter = "resource.labels.namespace_name = \"dev\" AND severity = \"DEBUG\""
}