resource "google_iam_folders_policy_binding" "c1" {
  folder            = "folders/123456789"
  location          = "global"
  display_name      = "valid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "binding-for-all-folder-principals"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/policy-1"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}