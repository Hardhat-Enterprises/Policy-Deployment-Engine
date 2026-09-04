resource "google_access_context_manager_service_perimeters" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  deletion_policy = "DELETE"

  service_perimeters {
    name  = "accessPolicies/123456789/servicePerimeters/deletion_policy_test"
    title = "deletion_policy_test"
  }
}
