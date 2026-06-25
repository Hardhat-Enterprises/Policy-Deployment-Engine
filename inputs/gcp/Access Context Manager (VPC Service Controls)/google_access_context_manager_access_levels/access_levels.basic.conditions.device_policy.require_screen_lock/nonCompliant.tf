resource "google_access_context_manager_access_levels" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  access_levels {
    name   = "accessPolicies/123456789/accessLevels/chromeos_no_lock"
    title  = "chromeos_no_lock"
    basic {
      conditions {
        device_policy {
          require_screen_lock = false
        }
      }
    }
  }
}
