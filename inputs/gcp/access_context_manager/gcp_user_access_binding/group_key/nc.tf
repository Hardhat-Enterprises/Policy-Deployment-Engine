# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_access_context_manager_gcp_user_access_binding" "nc" {
  organization_id = "123456789012"
  group_key       = "group:external-user@gmail.com"
  access_levels   = ["accessPolicies/123456789012/accessLevels/allow_secure"]
}