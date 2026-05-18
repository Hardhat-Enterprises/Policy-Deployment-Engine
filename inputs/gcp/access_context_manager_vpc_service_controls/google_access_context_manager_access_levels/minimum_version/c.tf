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
        device_policy {
          os_constraints {
            os_type         = "DESKTOP_CHROME_OS"
            minimum_version = "10.0.0"
          }
        }
      }
    }
  }
}
