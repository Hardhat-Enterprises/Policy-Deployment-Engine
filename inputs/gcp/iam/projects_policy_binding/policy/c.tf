# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_projects_policy_binding" "c" {
  #depends_on = [time_sleep.wait_60_seconds]
  project = "project_id" 
  location       = "global"
  display_name   = "binding for all principals in the project"
  policy_kind    = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "binding-for-all-project-principals_c"
  policy         = "organizations/org-c/locations/global/principalAccessBoundaryPolicies/principal_access_boundary_policy_id"
  condition {
    expression = "principal.type == 'iam.googleapis.com/ServiceAccount'"
    title = ""
    description = ""
    location = ""
  }
  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/project-number-123456789"
  }
}
