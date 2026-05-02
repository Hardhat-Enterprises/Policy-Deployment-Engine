resource "google_iam_projects_policy_binding" "c" {
  project           = "my-project"
  location          = "global"
  display_name      = "valid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "binding-c"

  policy = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/my-pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/my-project"
  }
}