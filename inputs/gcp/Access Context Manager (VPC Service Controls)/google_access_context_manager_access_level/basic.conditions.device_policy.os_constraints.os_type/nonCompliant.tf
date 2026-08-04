resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_os_type"
  title  = "non-compliant-os-type"

  basic {
    conditions {
      device_policy {
        os_constraints {
          os_type = "OS_UNSPECIFIED"
        }
      }
    }
  }
}
