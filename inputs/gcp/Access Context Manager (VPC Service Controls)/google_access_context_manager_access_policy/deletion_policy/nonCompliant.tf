resource "google_access_context_manager_access_policy" "non_compliant_example_1" {
  parent = "organizations/123456789"
  title  = "non-compliant-access-policy"

  deletion_policy = "DELETE"
}
