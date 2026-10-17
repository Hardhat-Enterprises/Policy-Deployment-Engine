resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/non_compliant_status_access_levels"
  title  = "service_perimeter"

  status {
    access_levels = []
  }
}
