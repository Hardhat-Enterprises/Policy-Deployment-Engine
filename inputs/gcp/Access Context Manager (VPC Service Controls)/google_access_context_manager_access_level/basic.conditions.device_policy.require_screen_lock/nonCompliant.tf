resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_example_1"
  title  = "c-require-screen-lock"
  basic {
    conditions {
      device_policy {
        require_screen_lock = false
      }
    }
  }
}
