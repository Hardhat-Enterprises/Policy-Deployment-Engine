resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_min_version"
  title  = "non_compliant_min_version"

  basic {
    conditions {
      device_policy {
        os_constraints {
          os_type         = "DESKTOP_WINDOWS"
          minimum_version = "9.0.0"
        }
      }
    }
  }
}
