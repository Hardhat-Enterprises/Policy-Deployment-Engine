resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "c"
  title  = "c-os_type"
  basic {
    combining_function = "AND"
    conditions {
      device_policy {
        os_constraints {
          os_type = "DESKTOP_CHROME_OS"
        }
      }
    }
  }
}