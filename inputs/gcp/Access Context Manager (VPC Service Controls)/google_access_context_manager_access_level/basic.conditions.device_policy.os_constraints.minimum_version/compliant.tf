resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_min_version"
  title  = "compliant_min_version"

  basic {
    conditions {
      device_policy {
        os_constraints {
          os_type         = "DESKTOP_WINDOWS"
          minimum_version = "10.0.0"
        }
      }
    }
  }
}
