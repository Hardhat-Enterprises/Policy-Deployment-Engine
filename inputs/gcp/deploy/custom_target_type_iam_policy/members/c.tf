data "google_iam_policy" "c" {
  binding {
    role = "roles/clouddeploy.releaser"
    members = [
      "user:dev-team@company.com",
      "serviceAccount:deploy-sa@my-project-id.iam.gserviceaccount.com",
      "group:deploy-team@company.com"
    ]
  }
}

resource "google_clouddeploy_custom_target_type_iam_policy" "c" {
  name        = "custom-target-type-c"
  location    = "us-central1"
  project     = "my-project-id"
  policy_data = data.google_iam_policy.c.policy_data
}