resource "google_access_context_manager_access_level" "non_compliant_example_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "non_compliant_example_1"
  title  = "nc-region"
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
