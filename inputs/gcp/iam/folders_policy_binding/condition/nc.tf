# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_folders_policy_binding" "nc" {
  #depends_on = [time_sleep.wait_60_seconds]
  folder = "folder_id" 
  location       = "global"
  display_name   = "binding for all principals in the folder"
  policy_kind    = "PRINCIPAL_ACCESS_BOUNDARY-UNSUPPORTED"
  policy_binding_id = "binding-for-all-folder-principals_nc"
  policy         = "organizations/123456789/locations/global/principalAccessBoundaryPolicies/principal_access_boundary_policy_id"
  condition {
    expression = "principal.type == 'iam.googleapis.com//UNSUPPORTED'"
    title = ""
    description = ""
    location = ""
  }
  target {
    principal_set = "//cloudresourcemanager.googleapis.com/folders/folder-number-123456789"
  }
}
