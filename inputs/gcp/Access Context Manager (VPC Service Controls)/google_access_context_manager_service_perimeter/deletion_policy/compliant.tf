resource "google_access_context_manager_service_perimeter" "compliant_deletion_policy" {
  parent = "accessPolicies/123456789"
  name   = "compliant_deletion_policy"
  title  = "protected_perimeter"

  deletion_policy = "PREVENT"
}
