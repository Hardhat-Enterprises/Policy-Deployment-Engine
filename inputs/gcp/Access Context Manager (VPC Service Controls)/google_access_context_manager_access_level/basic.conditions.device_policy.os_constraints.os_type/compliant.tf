resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_example_1"
  title  = "c-os_type"
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
