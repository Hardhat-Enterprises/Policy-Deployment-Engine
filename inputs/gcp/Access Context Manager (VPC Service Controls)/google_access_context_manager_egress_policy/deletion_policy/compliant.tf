resource "google_access_context_manager_egress_policy" "compliant_example_1" {
  egress_policy_name = "accessPolicies/123456/servicePerimeters/my_perimeter"
  resource           = "projects/123456789"
  deletion_policy    = "PREVENT"
}