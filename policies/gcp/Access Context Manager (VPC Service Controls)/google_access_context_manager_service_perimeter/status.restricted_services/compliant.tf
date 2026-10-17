resource "google_access_context_manager_service_perimeter" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_example_1"
  title  = "restrict_storage"
  status {
    restricted_services = ["storage.googleapis.com"]
  }
}
