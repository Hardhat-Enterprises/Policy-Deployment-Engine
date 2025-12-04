resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "c"
  title  = "c-require-screen-lock"
  basic {
    conditions {
      device_policy {
        require_screen_lock = true
      }
    }
  }
}