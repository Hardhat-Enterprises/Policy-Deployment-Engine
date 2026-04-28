resource "google_iam_folders_policy_binding" "nc" {
  folder            = "123456789"
  location          = "australia-southeast1"
  policy_binding_id = "binding-nc"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}