resource "google_iam_folders_policy_binding" "c" {
  folder            = "224774388"
  location          = "global"
  policy_binding_id = "folder-binding-c"

  policy = "organizations/224774388/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}