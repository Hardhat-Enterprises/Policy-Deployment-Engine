resource "google_access_context_manager_access_policy" "access-policy" {
  parent = "organizations/123456789"
  title  = "my policy"
  }
resource "google_access_context_manager_access_levels" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name  = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/c"
    title = "level_c"
    basic {
      conditions {
        required_access_levels = ["accessPolicies/123456789/accessLevels/base_level"]
      }
    }
  }
}
