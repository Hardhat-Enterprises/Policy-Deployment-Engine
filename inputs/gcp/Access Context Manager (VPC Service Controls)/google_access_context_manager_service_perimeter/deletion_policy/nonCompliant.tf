# deletion_policy allows deletion
resource "google_access_context_manager_service_perimeter" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_deletion_policy"
  title  = "service_perimeter"

  deletion_policy = "DELETE"
}
