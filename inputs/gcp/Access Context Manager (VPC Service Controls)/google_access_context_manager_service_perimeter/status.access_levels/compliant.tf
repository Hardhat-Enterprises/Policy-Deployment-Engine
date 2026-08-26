resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/example"
  title  = "example"

  status {
    access_levels = [
      "accessPolicies/123456789/accessLevels/trusted_access"
    ]
  }
}
