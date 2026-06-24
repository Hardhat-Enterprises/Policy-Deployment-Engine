resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "compliant_example_1"
  title  = "restrict_storage"
  status {
    restricted_services = ["storage.googleapis.com"]
  }
}
