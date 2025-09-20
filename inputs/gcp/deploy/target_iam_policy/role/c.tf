# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

data "google_iam_policy" "c" {
  binding {
    role = "roles/clouddeploy.operator"
    members = [
      "user:deploy-user@example.com",
    ]
  }
}

resource "google_clouddeploy_target_iam_policy" "c" {
  project     = "my-project"
  location    = "us-central1"
  name        = "c"
  policy_data = data.google_iam_policy.c.policy_data
}