resource "google_iam_folders_policy_binding" "non_compliant_example_1" {
  folder            = "123456789012"
  location          = "global"
  policy_binding_id = "folder-binding-bad"
  display_name      = "Example folder policy binding"
  deletion_policy   = "DELETE"

  policy = "organizations/123456789012/locations/global/principalAccessBoundaryPolicies/example-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/123456789012"
  }
}
