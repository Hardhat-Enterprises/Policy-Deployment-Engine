data "google_iam_policy" "nc" {
  binding {
    role = "roles/clouddeploy.developer"
    members = [
      "allUsers",
      "user:admin@example.com",
      "serviceAccount:deploy-sa@my-project-name.iam.gserviceaccount.com"
    ]
  }
}

resource "google_clouddeploy_target_iam_policy" "nc" {
  name        = "target-nc"
  project     = "my-project-name"
  location    = "us-central1"
  policy_data = data.google_iam_policy.nc.policy_data
}

