resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_device_management"
  title  = "compliant_device_management"

  basic {
    conditions {
      device_policy {
        allowed_device_management_levels = ["COMPLETE"]
      }
    }
  }
}
