data "google_iam_policy" "c" {
  binding {
    role = "roles/clouddeploy.developer"
    members = [
      "user:admin@example.com",
      "serviceAccount:deploy-sa@my-project-name.iam.gserviceaccount.com",
      "group:developers@example.com"
    ]
  }
}

resource "google_clouddeploy_target_iam_policy" "c" {
  name        = "target-c"
  project     = "my-project-name"
  location    = "us-central1"
  policy_data = data.google_iam_policy.c.policy_data
}