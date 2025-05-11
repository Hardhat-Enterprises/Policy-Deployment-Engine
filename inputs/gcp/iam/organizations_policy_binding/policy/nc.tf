# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_organizations_policy_binding" "nc" {
  #depends_on = [time_sleep.wait_60_seconds]
  organization   = "org-nc"
  location       = "other"
  display_name   = "binding for all principals in the Organization"
  policy_kind    = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "binding-for-all-org-principals_nc"
  policy         = "organizations/org-nc/locations/global/principalAccessBoundaryPolicies/principal_access_boundary_policy_id-nc"
  condition {
    expression = "principal.type == 'iam.googleapis.com/UNSUPPORTED'"
    title = ""
    description = ""
    location = ""
  }
  target {
    principal_set = "//cloudresourcemanager.googleapis.com/organizations/123456789"
  }
}
