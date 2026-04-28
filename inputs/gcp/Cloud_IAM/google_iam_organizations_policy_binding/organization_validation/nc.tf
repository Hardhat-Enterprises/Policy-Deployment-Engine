resource "google_iam_organizations_policy_binding" "nc" {
  organization      = ""
  location          = "global"
  display_name      = "Non Compliant Org Policy Binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "org-binding-nc"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/my-pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789"
  }
}