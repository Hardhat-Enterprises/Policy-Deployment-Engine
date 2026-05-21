resource "google_iam_projects_policy_binding" "nc" {
  project            = "smooth-verve-467716-v1"
  location           = "global"   
  display_name       = "Invalid Project Policy Binding"
  policy_kind        = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id  = "nc"

  policy  = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/123456789"
  }
}