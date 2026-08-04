resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_admin_approval"
  title  = "non-compliant-admin-approval"

  basic {
    conditions {
      device_policy {
        require_admin_approval = false
      }
    }
  }
}
