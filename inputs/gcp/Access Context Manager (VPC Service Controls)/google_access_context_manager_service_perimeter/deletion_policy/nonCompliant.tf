# deletion_policy allows deletion
resource "google_access_context_manager_service_perimeter" "non_compliant_deletion_policy_delete" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_deletion_policy_delete"
  title  = "unprotected_perimeter"

  deletion_policy = "DELETE"
}
