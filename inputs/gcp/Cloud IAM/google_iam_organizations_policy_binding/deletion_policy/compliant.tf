resource "google_iam_organizations_policy_binding" "compliant_example_1" {
  organization      = "123456789012"
  location          = "global"
  policy_binding_id = "organization-binding-good"
  display_name      = "Example organization policy binding"
  deletion_policy   = "PREVENT"

  policy = "organizations/123456789012/locations/global/principalAccessBoundaryPolicies/example-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789012"
  }
}
