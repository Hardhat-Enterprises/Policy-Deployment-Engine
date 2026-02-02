resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "nc"
  title  = "nc-os_type"
  basic {
    combining_function = "OR"
    conditions {
      device_policy {
        os_constraints {
          os_type = "DESKTOP_CHROME_OS"
        }
      }
    }
  }
}