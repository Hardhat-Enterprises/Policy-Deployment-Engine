resource "google_iam_folders_policy_binding" "nc" {
  folder            = "folders/123456789"
  location          = "australia-southeast2"
  policy_binding_id = "nc"
  display_name      = "Invalid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"

  policy = "organizations/999999999/locations/australia-southeast2/principalAccessBoundaryPolicies/unknown-policy"  

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}