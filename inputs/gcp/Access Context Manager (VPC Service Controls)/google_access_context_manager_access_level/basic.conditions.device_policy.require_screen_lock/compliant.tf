resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_screen_lock"
  title  = "compliant-screen-lock"

  basic {
    conditions {
      device_policy {
        require_screen_lock = true
      }
    }
  }
}
