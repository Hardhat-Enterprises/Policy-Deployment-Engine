resource "google_iam_folders_policy_binding" "nc" {
  folder            = "folders/123456789"
  location          = "australia-southeast2"
  policy_binding_id = "nc"
  display_name      = "Invalid binding"
  policy_kind       = "ACCESS"  
  policy            = "organizations/123456789/locations/australia-southeast2/principalAccessBoundaryPolicies/pde-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}