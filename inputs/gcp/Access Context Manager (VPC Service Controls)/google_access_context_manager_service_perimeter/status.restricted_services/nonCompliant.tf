# null-restricted_services
resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_example_1"
  title  = "restrict_storage"
  status {
    restricted_services = []
  }
}

# permissive-restricted_services
resource "google_access_context_manager_service_perimeter" "non_compliant_example_2" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_example_2"
  title  = "restrict_storage"
  status {
    restricted_services = ["*.googleapis.com"]
  }
}
