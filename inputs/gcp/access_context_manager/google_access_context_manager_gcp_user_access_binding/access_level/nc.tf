resource "google_access_context_manager_gcp_user_access_binding" "nc" {
  organization_id = "123456789012"
  group_key       = "group:secure-team@deakin.edu.au"
  access_levels   = ["accessPolicies/123456789012/accessLevels/allow_all"]
}