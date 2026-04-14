# Compliant: Only excluding health checks
resource "google_logging_project_exclusion" "c1" {
  name        = "health-check-exclusion"
  project     = "my-project"
  description = "Exclude health check logs - COMPLIANT"

  filter = "resource.type = \"k8s_container\" AND jsonPayload.health_check = true"
}

# Compliant: Excluding debug logs only
resource "google_logging_project_exclusion" "c2" {
  name        = "debug-exclusion"
  project     = "my-project"
  description = "Exclude debug logs from dev namespace - COMPLIANT"

  filter = "resource.labels.namespace_name = \"dev\" AND severity = \"DEBUG\""
}