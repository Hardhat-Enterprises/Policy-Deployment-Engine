resource "google_access_context_manager_access_levels" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  access_levels {
    name  = "accessPolicies/123456789/accessLevels/c"
    title = "level_c"
    basic {
      conditions {
        members = ["user:admin@example.com"]
      }
    }
  }
}
