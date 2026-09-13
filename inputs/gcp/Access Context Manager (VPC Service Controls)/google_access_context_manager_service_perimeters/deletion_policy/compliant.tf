resource "google_access_context_manager_service_perimeters" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  deletion_policy = "PREVENT"

  service_perimeters {
    name  = "accessPolicies/123456789/servicePerimeters/deletion_policy_test"
    title = "deletion_policy_test"
  }
}
