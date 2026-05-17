resource "google_iam_folders_policy_binding" "c" {
  folder            = "folders/123456789"
  location          = "global"
  policy_binding_id = "c"
  display_name      = "Valid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy            = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}