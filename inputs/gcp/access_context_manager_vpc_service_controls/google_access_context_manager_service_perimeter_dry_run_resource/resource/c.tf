resource "google_access_context_manager_access_policy" "access-policy" {
  parent = "organizations/123456789"
  title  = "my policy"
}

resource "google_access_context_manager_service_perimeter" "service-perimeter" {
  parent         = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name           = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/servicePerimeters/my_perimeter"
  title          = "my_perimeter"
  perimeter_type = "PERIMETER_TYPE_REGULAR"
}
resource "google_access_context_manager_service_perimeter_dry_run_resource" "c" {
  perimeter_name = "accessPolicies/123456/servicePerimeters/my_perimeter"
  resource       = "projects/123456789"
}