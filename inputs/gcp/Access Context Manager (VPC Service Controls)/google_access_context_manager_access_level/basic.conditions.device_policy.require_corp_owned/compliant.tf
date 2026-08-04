resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_corp_owned"
  title  = "compliant-corp-owned"

  basic {
    conditions {
      device_policy {
        require_corp_owned = true
      }
    }
  }
}
