resource "google_iam_projects_policy_binding" "nc" {
  project            = "INVALID_PROJECT_ID!!!" 
  location           = "global"
  display_name       = "Invalid Project Binding"
  policy_kind        = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id  = "binding-project-nc"

  policy  = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/INVALID_PROJECT_ID!!!"
  }
}