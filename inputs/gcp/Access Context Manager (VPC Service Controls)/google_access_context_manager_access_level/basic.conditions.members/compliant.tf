resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_members"
  title  = "compliant_members"

  basic {
    conditions {
      members = ["user:test@example.com"]
    }
  }
}
