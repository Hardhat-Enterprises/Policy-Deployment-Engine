# null-restricted_services
resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "non_compliant_example_1"
  title  = "restrict_storage"
  status {
    restricted_services = []
  }
}

# permissive-restricted_services
resource "google_access_context_manager_service_perimeter" "non_compliant_example_2" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "non_compliant_example_2"
  title  = "restrict_storage"
  status {
    restricted_services = ["*.googleapis.com"]
  }
}
