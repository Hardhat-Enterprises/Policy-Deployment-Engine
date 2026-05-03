resource "google_iam_folders_policy_binding" "nc" {
  folder            = "folders/123456789"
  location          = "global"
  policy_binding_id = "bad-binding"
  display_name      = "Invalid binding"
  policy_kind       = "ACCESS"  
  policy            = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}