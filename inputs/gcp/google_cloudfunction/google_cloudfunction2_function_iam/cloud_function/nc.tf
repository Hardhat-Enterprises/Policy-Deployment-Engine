data "google_iam_policy" "admin-nc" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloudfunctions2_function_iam_policy" "nc" {
  project = "google_cloudfunctions2_function"
  location = "us-central1"
  cloud_function = ""
  policy_data = data.google_iam_policy.admin.policy_data
}