resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_device_management"
  title  = "non_compliant_device_management"

  basic {
    conditions {
      device_policy {
        allowed_device_management_levels = ["NONE"]
      }
    }
  }
}
