# null-restricted_services
resource "google_access_context_manager_service_perimeter" "nc1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "nc1"
  title  = "restrict_storage"
  status {
    restricted_services = []
  }
}

# permissive-restricted_services
resource "google_access_context_manager_service_perimeter" "nc2" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "nc2"
  title  = "restrict_storage"
  status {
    restricted_services = ["*.googleapis.com"]
  }
}