resource "google_access_context_manager_ingress_policy" "c" {
  ingress_policy_name = "accessPolicies/123456/servicePerimeters/my_perimeter"
  resource            = "projects/123456789"
}
