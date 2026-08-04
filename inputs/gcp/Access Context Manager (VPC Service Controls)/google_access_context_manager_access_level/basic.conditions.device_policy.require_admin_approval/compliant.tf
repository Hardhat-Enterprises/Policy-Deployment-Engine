resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_admin_approval"
  title  = "compliant-admin-approval"

  basic {
    conditions {
      device_policy {
        require_admin_approval = true
      }
    }
  }
}
