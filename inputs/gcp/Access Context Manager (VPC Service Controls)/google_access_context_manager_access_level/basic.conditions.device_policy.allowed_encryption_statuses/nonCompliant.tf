resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "non_compliant_example_1"
  title  = "chromeos_no_lock"
  basic {
    conditions {
      device_policy {
        allowed_encryption_statuses = ["UNENCRYPTED"]
      }
    }
  }
}
