resource "google_access_context_manager_access_levels" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  access_levels {
    name  = "accessPolicies/123456789/accessLevels/nc"
    title = "level_nc"
    basic {
      conditions {
        members = ["user:hacker@example.com"]
      }
    }
  }
}
