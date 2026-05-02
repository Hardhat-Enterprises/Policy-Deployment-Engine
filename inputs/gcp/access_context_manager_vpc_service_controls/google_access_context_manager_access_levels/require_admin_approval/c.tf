resource "google_access_context_manager_access_levels" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name  = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/c"
    title = "level_c"
    basic {
      conditions {
        device_policy {
          require_admin_approval = true
        }
      }
    }
  }
}
