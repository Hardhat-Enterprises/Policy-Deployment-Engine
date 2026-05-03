resource "google_iam_folders_policy_binding" "c" {
  folder            = "folders/123456789"
  location          = "global"
  policy_binding_id = "pde-binding-03"
  display_name      = "Valid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}