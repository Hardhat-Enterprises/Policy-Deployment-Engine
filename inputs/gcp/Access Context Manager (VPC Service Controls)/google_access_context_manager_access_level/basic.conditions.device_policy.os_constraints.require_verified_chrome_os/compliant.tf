resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_verified_chrome"
  title  = "compliant_verified_chrome"

  basic {
    conditions {
      device_policy {
        os_constraints {
          os_type                    = "DESKTOP_CHROME_OS"
          require_verified_chrome_os = true
        }
      }
    }
  }
}
