resource "google_iam_folders_policy_binding" "nc" {
  folder             = "123456789"
  location           = "global"
  display_name       = "Invalid Folder Binding"
  policy_kind        = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id  = "binding-folder-nc"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
   
    principal_set = "//cloudresourcemanager.googleapis.com/projects/123456789"
  }
}