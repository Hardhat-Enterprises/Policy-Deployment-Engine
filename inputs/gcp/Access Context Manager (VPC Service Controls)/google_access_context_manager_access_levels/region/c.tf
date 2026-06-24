resource "google_access_context_manager_access_levels" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/chromeos_no_lock"
    title  = "chromeos_no_lock"
    basic {
      conditions {
        regions = [
          "australia-southeast1","australia-southeast2",
        ]
      }
    }
  }
}
