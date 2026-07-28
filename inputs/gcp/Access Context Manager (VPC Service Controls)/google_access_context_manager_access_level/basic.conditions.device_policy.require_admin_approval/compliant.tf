resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "compliant_example_1"
  title  = "chromeos_no_lock"
  basic {
    conditions {
      device_policy {
        require_admin_approval = true
      }
    }
  }
}
