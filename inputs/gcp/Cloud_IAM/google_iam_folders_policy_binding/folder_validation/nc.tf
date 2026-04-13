resource "google_iam_folders_policy_binding" "nc" {
  folder            = ""
  location          = "global"
  policy_binding_id = "folder-binding-nc"

  policy = "organizations/224774388/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/224774388"
  }
}