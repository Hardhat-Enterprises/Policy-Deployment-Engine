# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_projects_policy_binding" "nc" {
  #depends_on = [time_sleep.wait_60_seconds]
  project = "project_id" 
  location       = "other"
  display_name   = "binding for all principals in the project"
  policy_kind    = "PRINCIPAL_ACCESS_BOUNDARY-UNSUPPORTED"
  policy_binding_id = "binding-for-all-project-principals_nc"
  policy         = "organizations/org-nc/locations/global/principalAccessBoundaryPolicies/principal_access_boundary_policy_id-nc"
  condition {
    expression = "principal.type == 'iam.googleapis.com//UNSUPPORTED'"
    title = ""
    description = ""
    location = ""
  }
  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/project-number-123456789"
  }
}
