resource "google_access_context_manager_access_levels" "compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/chromeos_no_lock"
    title  = "chromeos_no_lock"
    basic {
      conditions {
        device_policy {
          os_constraints {
            os_type = "DESKTOP_CHROME_OS"
          }
        }
      }
    }
  }
}
