resource "google_iam_organizations_policy_binding" "c" {
  organization      = "123456789"
  location          = "australia-southeast2"
  display_name      = "c"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "org-binding-c"

  policy = "organizations/123456789/locations/australia-southeast2/principalAccessBoundaryPolicies/my-pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789"
  }
}