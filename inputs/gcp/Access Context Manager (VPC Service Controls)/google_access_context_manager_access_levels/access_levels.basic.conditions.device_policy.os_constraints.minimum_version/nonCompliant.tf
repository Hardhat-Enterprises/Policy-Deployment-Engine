resource "google_access_context_manager_access_levels" "non_compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name  = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/nc"
    title = "level_nc"
    basic {
      conditions {
        device_policy {
          os_constraints {
            os_type         = "DESKTOP_CHROME_OS"
            minimum_version = "9.0.0"
          }
        }
      }
    }
  }
}
