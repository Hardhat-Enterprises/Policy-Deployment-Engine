resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/123456789"
  name   = "accessPolicies/123456789/accessLevels/non_compliant_region"
  title  = "non-compliant-region"

  basic {
    conditions {
      regions = ["US"]
    }
  }
}