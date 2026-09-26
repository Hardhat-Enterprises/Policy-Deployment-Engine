# Compliant: Only excluding health checks
resource "google_logging_project_exclusion" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "my-project"
  description = "Exclude health check logs - COMPLIANT"
  filter      = "resource.type = \"k8s_container\" AND jsonPayload.health_check = true"
}

# Compliant: Excluding debug logs only
resource "google_logging_project_exclusion" "compliant_example_2" {
  name        = "compliant_example_2"
  project     = "my-project"
  description = "Exclude health check logs - COMPLIANT"
  filter      = "resource.labels.namespace_name = \"dev\" AND severity = \"DEBUG\""
}
