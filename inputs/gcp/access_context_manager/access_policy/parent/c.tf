# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_access_context_manager_access_policy" "c" {
  parent = "organizations/123456789012"
  title  = "DeakinAccessPolicy"
}
