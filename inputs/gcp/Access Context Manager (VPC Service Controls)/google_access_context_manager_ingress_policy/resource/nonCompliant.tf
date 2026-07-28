resource "google_access_context_manager_ingress_policy" "non_compliant_example_1" {
  ingress_policy_name = "accessPolicies/123456/servicePerimeters/my_perimeter"
  resource            = "projects/999999999"
}
