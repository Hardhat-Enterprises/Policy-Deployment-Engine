resource "google_access_context_manager_access_level" "nc" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "nc"
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