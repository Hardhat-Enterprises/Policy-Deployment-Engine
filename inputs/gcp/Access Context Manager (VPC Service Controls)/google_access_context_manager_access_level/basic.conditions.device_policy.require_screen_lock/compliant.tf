resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "compliant_example_1"
  title  = "c-require-screen-lock"
  basic {
    conditions {
      device_policy {
        require_screen_lock = true
      }
    }
  }
}
