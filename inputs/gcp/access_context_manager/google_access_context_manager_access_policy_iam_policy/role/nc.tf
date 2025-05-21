data "google_iam_policy" "bad" {
  binding {
    role = "roles/owner" # Over-permissive role
    members = [
      "domain:deakin.edu.au"
    ]
  }
}

resource "google_access_context_manager_access_policy_iam_policy" "nc" {
  name        = "accessPolicies/123456789012"
  policy_data = data.google_iam_policy.bad.policy_data
}
