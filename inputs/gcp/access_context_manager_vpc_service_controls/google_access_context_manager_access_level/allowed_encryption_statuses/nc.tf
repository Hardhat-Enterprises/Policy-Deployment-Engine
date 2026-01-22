resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/chromeos_no_lock"
  title  = "chromeos_no_lock"
  basic {
    conditions {
      device_policy {
        allowed_encryption_statuses = ["UNENCRYPTED"]
      }
    }
  }
}