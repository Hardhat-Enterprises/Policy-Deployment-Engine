resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/noncompliant_status_access_levels"
  title  = "noncompliant_status_access_levels"

  status {
    access_levels = []
  }
}
