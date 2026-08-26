resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/servicePerimeters/example"
  title  = "example"

  status {
    restricted_services = ["storage.googleapis.com"]

    vpc_accessible_services {
      enable_restriction = true
    }
  }
}
