resource "google_access_context_manager_access_level" "c" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
  name   = "c"
  title  = "c-region"
  basic {
    conditions {
      regions = [
        "australia-southeast1", "australia-southeast2",
      ]
    }
  }
}