resource "google_iam_folders_policy_binding" "c" {
  folder             = "123456789"
  location           = "global"
  display_name       = "Valid Folder Binding"
  policy_kind        = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id  = "binding-folder-c"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}