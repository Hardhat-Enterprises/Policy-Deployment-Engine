resource "google_iam_organizations_policy_binding" "non_compliant_example_1" {
  organization      = "123456789012"
  location          = "global"
  policy_binding_id = "organization-binding-bad"
  display_name      = "Example organization policy binding"
  deletion_policy   = "DELETE"

  policy = "organizations/123456789012/locations/global/principalAccessBoundaryPolicies/example-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789012"
  }
}
