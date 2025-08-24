# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Cloud Deploy Custom Target Type IAM Policy - Non-compliant Configuration (Members focus)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_clouddeploy_custom_target_type_iam_policy" "nc" {
  name        = "test-custom-target-type-nc"
  policy_data = data.google_iam_policy.non_compliant.policy_data
}

data "google_iam_policy" "non_compliant" {
  binding {
    role = "roles/viewer"
    members = [
      "allUsers",
      "allAuthenticatedUsers",
      "user:external@gmail.com",
      "domain:*",
    ]
  }
}