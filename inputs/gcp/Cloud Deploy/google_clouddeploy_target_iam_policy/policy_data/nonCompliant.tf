# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

data "google_iam_policy" "nc" {
  binding {
    role = "roles/owner"
    members = [
      "user:admin-user@example.com",
    ]
  }
}

resource "google_clouddeploy_target_iam_policy" "non_compliant_example_1" {
  project     = "my-project"
  location    = "us-central1"
  name        = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc.policy_data
}
