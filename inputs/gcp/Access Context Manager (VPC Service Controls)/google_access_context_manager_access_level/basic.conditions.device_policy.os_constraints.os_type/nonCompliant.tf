resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_example_1"
  title  = "nc-os_type"
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
