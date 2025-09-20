# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

data "google_iam_policy" "delivery_pipeline_nc" {
  binding {
    role = "roles/owner"
    members = [
      "user:admin-user@example.com",
    ]
  }
}

resource "google_clouddeploy_delivery_pipeline_iam_policy" "nc" {
  project     = "my-project"
  location    = "us-central1"
  name        = "nc"
  policy_data = data.google_iam_policy.delivery_pipeline_nc.policy_data
}