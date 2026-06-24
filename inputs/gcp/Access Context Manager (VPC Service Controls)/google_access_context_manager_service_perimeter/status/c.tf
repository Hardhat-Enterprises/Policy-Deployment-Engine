resource "google_access_context_manager_service_perimeter" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "c"
  title  = "restrict_storage"
  status {
    restricted_services = ["storage.googleapis.com"]
  }
}