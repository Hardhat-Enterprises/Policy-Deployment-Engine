resource "google_iam_folders_policy_binding" "c" {
  
  folder            = "123456789"
  location          = "australia-southeast2"
  policy_binding_id = "c"

  policy = "organizations/123456789/locations/australia-southeast2/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789"
  }
}