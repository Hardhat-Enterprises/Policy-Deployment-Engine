resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "c"
  title  = "chromeos_no_lock"
  basic {
    conditions {
      regions = [
        "CH",
        "IT",
        "US",
      ]
    }
  }
}