resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/non_compliant_status_vpc_enable_restriction"
  title  = "service_perimeter"

  status {
    restricted_services = ["storage.googleapis.com"]

    vpc_accessible_services {
      enable_restriction = false
    }
  }
}
