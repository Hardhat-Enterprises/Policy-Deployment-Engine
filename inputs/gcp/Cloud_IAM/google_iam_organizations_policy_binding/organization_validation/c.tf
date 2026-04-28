resource "google_iam_organizations_policy_binding" "c" {
  organization      = "12345678"
  location          = "global"
  display_name      = "Compliant Org Policy Binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "org-binding-c"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/my-pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789"
  }
}