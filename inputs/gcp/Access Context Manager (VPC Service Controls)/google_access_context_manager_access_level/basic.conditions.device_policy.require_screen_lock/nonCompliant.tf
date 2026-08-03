resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_screen_lock"
  title  = "non-compliant-screen-lock"

  basic {
    conditions {
      device_policy {
        require_screen_lock = false
      }
    }
  }
}
