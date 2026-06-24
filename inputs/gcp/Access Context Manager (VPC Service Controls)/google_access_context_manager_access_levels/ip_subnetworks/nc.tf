resource "google_access_context_manager_access_levels" "nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  access_levels {
    name  = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/nc"
    title = "level_nc"
    basic {
      conditions {
        ip_subnetworks = ["10.0.0.0/8"]
      }
    }
  }
}
