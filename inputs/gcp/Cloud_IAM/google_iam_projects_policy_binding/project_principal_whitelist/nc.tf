resource "google_iam_projects_policy_binding" "nc" {
  project            = "smooth-verve-467716-v1"
  location           = "australia-southeast2"
  display_name       = "unapproved-project-binding"
  policy_kind        = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id  = "nc"

  policy = "organizations/123456789/locations/australia-southeast2/principalAccessBoundaryPolicies/pab-policy"

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/random-external-project"
  }
}