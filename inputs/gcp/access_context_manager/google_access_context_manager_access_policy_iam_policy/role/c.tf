data "google_iam_policy" "viewer" {
  binding {
    role = "roles/viewer"
    members = [
      "domain:deakin.edu.au",
    ]
  }
}

resource "google_access_context_manager_access_policy_iam_policy" "c" {
  name        = "accessPolicies/123456789012"
  policy_data = data.google_iam_policy.viewer.policy_data
}
