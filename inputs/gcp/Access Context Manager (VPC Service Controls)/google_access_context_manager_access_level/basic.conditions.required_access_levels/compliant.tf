resource "google_access_context_manager_access_level" "compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/compliant_required"
  title  = "compliant_required"

  basic {
    conditions {
      required_access_levels = [
        "accessPolicies/123456789/accessLevels/base_level"
      ]
    }
  }
}
