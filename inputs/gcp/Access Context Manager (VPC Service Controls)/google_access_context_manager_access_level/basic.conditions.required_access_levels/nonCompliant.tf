resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_required"
  title  = "non_compliant_required"

  basic {
    conditions {
      required_access_levels = [
        "accessPolicies/123456789/accessLevels/unapproved_level"
      ]
    }
  }
}
