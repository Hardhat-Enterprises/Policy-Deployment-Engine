resource "google_access_context_manager_access_levels" "non_compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name  = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/nc"
    title = "level_nc"
    basic {
      conditions {
        required_access_levels = ["accessPolicies/123456789/accessLevels/nc"]
      }
    }
  }
}
