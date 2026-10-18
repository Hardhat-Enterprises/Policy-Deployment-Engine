# Non-compliant: Exclusion is disabled
resource "google_logging_project_exclusion" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "my-project"
  description = "Active exclusion - COMPLIANT"
  disabled    = true
  filter      = "resource.type = \"k8s_container\" AND jsonPayload.health_check = true"
}

# Non-compliant: Security exclusion that's disabled
resource "google_logging_project_exclusion" "non_compliant_example_2" {
  name        = "non_compliant_example_2"
  project     = "my-project"
  description = "Explicitly active exclusion - COMPLIANT"
  disabled    = true
  filter      = "resource.labels.namespace_name = \"dev\" AND severity = \"DEBUG\""
}
