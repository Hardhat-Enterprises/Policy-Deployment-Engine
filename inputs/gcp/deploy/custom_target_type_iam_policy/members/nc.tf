data "google_iam_policy" "nc" {
  binding {
    role = "roles/clouddeploy.releaser"
    members = [
      "allUsers",
      "allAuthenticatedUsers",
      "user:admin@gmail.com"
    ]
  }
}

resource "google_clouddeploy_custom_target_type_iam_policy" "nc" {
  name        = "custom-target-type-nc"
  location    = "us-central1"
  project     = "my-project-id"
  policy_data = data.google_iam_policy.nc.policy_data
}