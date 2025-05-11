# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

data "google_iam_policy" "access_policy_non_compliant" {
  binding {
    role = "roles/viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_access_context_manager_access_policy_iam_policy" "nc" {
  name        = "accessPolicies/123456789012"
  policy_data = data.google_iam_policy.access_policy_non_compliant.policy_data
}