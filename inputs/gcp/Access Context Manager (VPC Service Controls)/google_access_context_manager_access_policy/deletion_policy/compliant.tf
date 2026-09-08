resource "google_access_context_manager_access_policy" "compliant_example_1" {
  parent = "organizations/123456789"
  title  = "compliant-access-policy"

  deletion_policy = "PREVENT"
}
